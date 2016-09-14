" call plug#begin('~/.vim/plugged')
silent! if plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-journal'

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

Plug 'junegunn/limelight.vim'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'

" Edit
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'rhysd/vim-grammarous'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'

" Browsing
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch', { 'for': 'cpp' }
Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }

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

if v:version >= 703
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'      }
endif
Plug 'justinmk/vim-gtfo'

" Lang
Plug 'Lokaltog/vim-powerline'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'cc'] }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'sbt.scala', 'markdown'] }
Plug 'ekalinin/Dockerfile.vim'
Plug 'chrisbra/unicode.vim', { 'for': 'journal' }

" Lint
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fholgado/minibufexpl.vim'
Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'lilydjwg/fcitx.vim'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()
endif


" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

let mapleader      = ' '


" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

set nu
set autoindent
set smartindent
set lazyredraw
set ignorecase smartcase
set incsearch
set hlsearch
set laststatus=2
set showcmd
set visualbell
set hidden
set expandtab smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nocursorline

set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P


set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set guioptions-=m
set guioptions-=T

fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
map <silent> <F11> :call ToggleFullscreen()<CR>
"autocmd VimEnter * call ToggleFullscreen()
set ruler
set cursorline
set cursorcolumn

set guifont=YaHei\ Consolas\ Hybrid\ 10.5


" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" Copy
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" NERD Tree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=22
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" Tagbar
if v:version >= 703
    let tagbar_left=1
    inoremap <F10> <esc>:TagbarToggle<cr>
    nnoremap <F10> :TagbarToggle<cr>
    let tagbar_width=32
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
    let g:tagbar_sort = 0
endif

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
" MiniBufExplorer
map <Leader>bl :MBEToggle<cr>
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j


" ----------------------------------------------------------------------------
" Markdown headings
" ----------------------------------------------------------------------------
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

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

" ----------------------------------------------------------------------------
" <Enter> | vim-easy-align
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

let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  " hi NonText ctermfg=101
  Limelight
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>

let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1


" UltiSnips 
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Fswitch
nmap <silent> <Leader>fs :FSHere<cr>

" Ctrlsf
nnoremap <Leader>sp :CtrlSF<CR>

" Gundo
nnoremap <Leader>ud :GundoToggle<CR>
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
set undodir=~/.undo_history/
set undofile

" Wildfire
map <Leader>sf <Plug>(wildfire-fuel)
vmap <Leader>sw <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" YCM
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

" Multiple-cursors
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" Replace
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" Protodef
let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1
