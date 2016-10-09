" >>>>
" .vimrc of Bo Liu
" https://github.com/HmyBmny/vimrc

set nocompatible

" <<<<
" >>>>
" VIM-PLUG BLOCK

silent! if plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'kristijanhusak/vim-hybrid-material'

" Edit
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'
Plug 'vim-scripts/YankRing.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'objc'] }
Plug 'gcmt/wildfire.vim'

" Browsing
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }
Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

augroup nerd_loader
autocmd!
autocmd VimEnter * silent! autocmd! FileExplorer
autocmd BufEnter,BufNew *
    \  if isdirectory(expand('<amatch>'))
    \|   call plug#load('nerdtree')
    \|   execute 'autocmd! nerd_loader'
    \| endif
augroup END

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'      }

" Lang
Plug 'sheerun/vim-polyglot'

" Lint
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }

Plug 'fholgado/minibufexpl.vim'
Plug 'sjl/gundo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'kien/ctrlp.vim'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

function! BuildYCM(info)
if a:info.status == 'installed' || a:info.force
!./install.py --clang-completer
endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()
endif

" <<<<
" >>>>
" BASIC SETTINGS

let mapleader = ';'

set encoding=utf-8

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store lots of :cmdline history
set history=500

" Show line numbers
set nu

set nowrap

" Autoindent when starting new line
set autoindent
set smartindent
set lazyredraw

" Ignore case when searching
set ignorecase 

" Don't ignore case when search has capital letter
set smartcase

" Enable highlighted case-insensitive incremential search
set incsearch

" Enble search highlighting
set hlsearch

" Always show window statuses
set laststatus=2

" Show the size of block one selected in visual mode
set showcmd

" Hide buffers
set hidden
set visualbell

" Indent using four spaces
set expandtab smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P

set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

function! ToggleFullscreen()
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

map <silent> <F11> :call ToggleFullscreen()<CR>
imap <silent> <F11> <esc>:call ToggleFullscreen()<CR>
" autocmd VimEnter * call ToggleFullscreen()

" Show the line and column number of the cursor position
set ruler

" Highlight line under cursor
set cursorline
set cursorcolumn

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*


" <<<<
" >>>>
" MAPPINGS

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" Save
inoremap <C-s>     <C-O>:w<cr>
nnoremap <C-s>     :w<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>s :w<cr>

" Copy
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a
inoremap <C-^> <C-o><C-^>

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------

nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>lw <C-W>l

" ----------------------------------------------------------------------------
" :CopyRTF
" ----------------------------------------------------------------------------

function! s:colors(...)
return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
    \                  'v:val !~ "^/usr/"'),
    \           'fnamemodify(v:val, ":t:r")'),
    \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

" ----------------------------------------------------------------------------
" <F8> | Color scheme selector
" ----------------------------------------------------------------------------

set background=dark
colorscheme solarized

function! s:rotate_colors()
if !exists('s:colors')
let s:colors = s:colors()
endif
let name = remove(s:colors, 0)
call add(s:colors, name)
execute 'colorscheme' name
redraw
echo name
endfunction

nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>
inoremap <silent> <F8> <esc>:call <SID>rotate_colors()<cr>

" <<<<
" >>>>
" PLUGINS

" ----------------------------------------------------------------------------
" vim-easy-align
" ----------------------------------------------------------------------------

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '\': { 'pattern': '\\' },
\ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
\ ']': {
\     'pattern':       '\]\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       ')\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ 'f': {
\     'pattern': ' \(\S\+(\)\@=',
\     'left_margin': 0,
\     'right_margin': 0
\   },
\ 'd': {
\     'pattern': ' \ze\S\+\s*[;=]',
\     'left_margin': 0,
\     'right_margin': 0
\   }
\ }

" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap ga <Plug>(EasyAlign)
nmap gaa ga_

" xmap <Leader><Enter>   <Plug>(LiveEasyAlign)
" nmap <Leader><Leader>a <Plug>(LiveEasyAlign)

" inoremap <silent> => =><Esc>mzvip:EasyAlign/=>/<CR>`z$a<Space>

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" ----------------------------------------------------------------------------
" vim-multiple-cursors
" ----------------------------------------------------------------------------

let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" ----------------------------------------------------------------------------
" vim-move
" ----------------------------------------------------------------------------

let g:move_key_modifier = 'C'

" ----------------------------------------------------------------------------
" YankRing.vim
" ----------------------------------------------------------------------------

nnoremap <silent> <F9> :YRShow<CR>
inoremap <silent> <F9> <esc>:YRShow<CR>

" ----------------------------------------------------------------------------
" auto-pairs
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" vim-operator-user
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" vim-clang-format
" ----------------------------------------------------------------------------

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
autocmd FileType c,cpp,objc nnoremap <F12> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <F12> :ClangFormat<CR>
autocmd FileType c,cpp,objc inoremap <F12> <esc>:ClangFormat<CR>
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
nmap <Leader>C :ClangFormatAutoToggle<CR>

" ----------------------------------------------------------------------------
" wildfire.vim
" ----------------------------------------------------------------------------

map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

" ----------------------------------------------------------------------------
" vim-indent-guides
" ----------------------------------------------------------------------------

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" ----------------------------------------------------------------------------
" vim-fswitch
" ----------------------------------------------------------------------------

nmap <silent> <Leader>fs :FSHere<cr>

" ----------------------------------------------------------------------------
" vim-protodef
" ----------------------------------------------------------------------------

let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1

" ----------------------------------------------------------------------------
" nerdcommenter
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

inoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>

let NERDTreeWinSize=22
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" ----------------------------------------------------------------------------
" tarbar
" ----------------------------------------------------------------------------

inoremap <F2> <esc>:TagbarToggle<cr>
nnoremap <F2> :TagbarToggle<cr>

let tagbar_left=1
let tagbar_width=32
let g:tagbar_sort = 0
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
 \ 'ctagstype' : 'c++',
 \ 'kinds'     : [
     \ 'c:classes:0:1',
     \ 'd:macros:0:1',
     \ 'e:enumerators:0:0', 
     \ 'f:functions:0:1',
     \ 'g:enumeration:0:1',
     \ 'l:local:0:1',
     \ 'm:members:0:1',
     \ 'n:namespaces:0:1',
     \ 'p:functions_prototypes:0:1',
     \ 's:structs:0:1',
     \ 't:typedefs:0:1',
     \ 'u:unions:0:1',
     \ 'v:global:0:1',
     \ 'x:external:0:1'
 \ ],
 \ 'sro'        : '::',
 \ 'kind2scope' : {
     \ 'g' : 'enum',
     \ 'n' : 'namespace',
     \ 'c' : 'class',
     \ 's' : 'struct',
     \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
     \ 'enum'      : 'g',
     \ 'namespace' : 'n',
     \ 'class'     : 'c',
     \ 'struct'    : 's',
     \ 'union'     : 'u'
 \ }
\ }

" ----------------------------------------------------------------------------
" vim-polyglot
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------

let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" ----------------------------------------------------------------------------
" minibufexpl
" ----------------------------------------------------------------------------

inoremap <F4> <esc>:MBEToggle<cr>
nnoremap <F4> :MBEToggle<cr>

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------

nnoremap <Leader>ud :GundoToggle<CR>

set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

if !strlen(finddir('~/.vim/undofiles'))
echo "undofiles[~/.vim/undofiles] not found. Now it's being created. Press ENTER or type command to continue."
!mkdir -p ~/.vim/undofiles
endif

if v:version >= 703
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+1 
endif

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------

nnoremap <c-f> :CtrlSF<CR>

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'

" ----------------------------------------------------------------------------
" vim-instant-markdown
" ----------------------------------------------------------------------------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

nnoremap <Leader>md :InstantMarkdownPreview<CR>

" ----------------------------------------------------------------------------
" YouCompleteMe
" ----------------------------------------------------------------------------

set completeopt-=preview

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
inoremap <leader>; <C-x><C-o>

highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" <<<<
