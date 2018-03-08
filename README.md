C/C++ IDE
===============================================

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
    - [Via curl](#via-curl)
    - [Via wget](#via-wget)
- [Included Plugins](#included-plugins)
    - [Colors](#colors)
    - [Editing](#editing)
    - [Navigation](#navigation)
    - [View](#view)
    - [Linting](#linting)
    - [Formerly included plugins](#formerly-included-plugins)
- [Keymaps](#keymaps)
    - [Basic](#basic)
        - [Normal mode](#normal-mode)
        - [Insert mode](#insert-mode)
        - [Visual mode](#visual-mode)
    - [Plugins](#plugins)
        - [Normal mode](#normal-mode-1)
        - [Insert mode](#insert-mode-1)
        - [Visual mode](#visual-mode-1)
- [Options](#options)
    - [Building vim from source](#building-vim-from-source)
    - [Using vim as a python IDE](#using-vim-as-a-python-ide)
    - [Using vim as a Go IDE](#using-vim-as-a-go-ide)
- [FAQ](#faq)
- [Contact](#contact)
- [License](#license)

Introduction
-----

Building vim editor in Linux into an effective C/C++ programming IDE, supporting [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) as a code-completion engine.

![screenshot](screenshot.png)

Features
-----

- Automatic download the latest version of libclang and compile the ycm_core library that YCM needs
- One-step install
- Supported all GNU/Linux
- On-demand loading for faster startup time
- Semantic auto-completion
- Syntax checking
- Syntax highlighting for C++11/14
- Preservation of historical records
- Instantly preview markdown files
- More

Requirements
-----

- vim `7.4.143+` with `Python 2` or `Python 3` support
- `npm -g install instant-markdown-d` For plugin vim-instant-markdown
- `xdg-utils` For plugin vim-instant-markdown
- `nodejs-legacy` For Debian-based systems
- `wmctrl` Fullscreen needs
- `cmake` Compile the ycm_core library
- `ctags` For plugin tarbar
- `ack-grep` For plugin ctrlsf

Installation
-----

### Via curl

    curl -o - https://raw.githubusercontent.com/HmyBmny/vimrc/master/install-vim-plugins | sh

### Via wget

    wget -O - https://raw.githubusercontent.com/HmyBmny/vimrc/master/install-vim-plugins | sh

Included Plugins
-----

I think you should read the docs of these plugins and .vimrc to use them efficiently.

- [vim-plug](https://github.com/junegunn/vim-plug): minimalist plugin manager

### Colors
- [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized): precision colorscheme
- [molokai](https://github.com/tomasr/molokai): port of the monokai theme for TextMate
- [spacemacs-theme.vim](https://github.com/colepeters/spacemacs-theme.vim): Spacemacs-flavoured theme, for use only in true-colour terminals
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): a collection of 100+ language packs

### Editing
- [ultisnips](https://github.com/SirVer/ultisnips): ultimate snippet solution
- [gundo.vim](https://github.com/sjl/gundo.vim): visualise your undo tree
- [vim-move](https://github.com/matze/vim-move): move lines and selections up and down
- [auto-pairs](https://github.com/jiangmiao/auto-pairs): insert or delete `[]`, `()`, `""` etc. in pairs
- [vim-operator-user](https://github.com/kana/vim-operator-user): define your own operator easily
- [wildfire.vim](https://github.com/gcmt/wildfire.vim): smart selection of the closest text object
- [fcitx.vim](https://github.com/lilydjwg/fcitx.vim): keep and restore fcitx state (Chinese text input method framework) when leaving/re-entering insert mode
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter): intensely orgasmic commenting
- [vim-protodef](https://github.com/derekwyatt/vim-protodef): pull in C++ function prototypes into implementation files
- [vim-instant-markdown](https://github.com/suan/vim-instant-markdown): open browser window when editing Markdown
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe): fast, as-you-type code-completion engine

### Navigation
- [tagbar](https://github.com/majutsushi/tagbar): display tags in a window, ordered by scope
- [vim-fswitch](https://github.com/derekwyatt/vim-fswitch): switch between companion source files (e.g. `.h` and `.cpp`)
- [nerdtree](https://github.com/scrooloose/nerdtree): filesystem tree explorer
- [vim-fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): fuzzy file, buffer, mru, tag, etc. finder
- [ctrlsf.vim](https://github.com/dyng/ctrlsf.vim): search for code and edit it in-place
- [minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim): buffer explorer that takes very little screen space

### View
- [indentLine](https://github.com/Yggdroot/indentLine): display the indention levels with thin vertical lines
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter): show a Git diff in the gutter, stage/undo hunks

### Linting
- [ale](https://github.com/w0rp/ale): as-you-type, asynchronous lint engine

### Formerly included plugins
These are not included any more, but you can install them manually if you want.

- *[vim-easy-align](https://github.com/junegunn/vim-easy-align): alignment plugin*
- *[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): true Sublime Text style multiple selections*
- *[vim-clang-format](https://github.com/rhysd/vim-clang-format): format C, C++, Obj-C, Java, JavaScript and TypeScript with clang-format*

Keymaps
-----

The `<leader>` key is `;`

### Basic

#### Normal mode

- `;w` Write (save) the file, but don't exit
- `;q` Quit
- `;Q` Quit and throw away changes
- `;p` Paste
- `;hw` Jump to the left window
- `;jw` Jump to the down window
- `;kw` Jump to the up window
- `;lw` Jump to the right window
- `<tab>` Jump to the next window
- `<S-tab>` Jump to the previous window
- `]q` Jump to next record/match in quickfix list
- `[q` Jump to previous record/match in quickfix list
- `<F8>` Change color scheme
- `<F11>` Fullscreen

#### Insert mode

- `<C-s>` Write (save) the file, but don't exit
- `<C-h>` Move left
- `<C-j>` Move down
- `<C-k>` Move up
- `<C-l>` move right
- `<F8>` Change color scheme
- `<F11>` Fullscreen

#### Visual mode

- `;y` Copy

### Plugins

#### Normal mode

- `;fs` Switch between companion source files (e.g. ".h" and ".cpp")
- `]b` Jump to the next buffer 
- `[b` Jump to the previous buffer 
- `;ud` Toggle Gundo visible 
- `<C-f>` Search and split a new window to show search result
- `<C-p>` Open ctrlp window (alternative :CtrlP)
- `;md` Launch the preview window for current markdown file
- `;jc` Go to declaration
- `;jd` Go to definition
- `<F2>` Toogle Tagbar visible
- `<F3>` Toogle NERD-Tree visible
- `<F4>` Toogle minibufexpl visble
- `<F12>` Format your C family code

#### Insert mode

- `<F2>` Toogle Tagbar visible
- `<F3>` Toogle NERD-Tree visible
- `<F4>` Toogle minibufexpl visble
- `<F9>` Show history of previous yanks, changes and deletes
- `<F12>` Format your C family code

#### Visual mode

- `<C-k>` Move current line/selections up
- `<C-j>` Move current line/selections down

### Options

#### Building vim from source

- Install all the following libraries

    - Ubuntu

        ```
        sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.3 lua5.3-dev libperl-dev git

        sudo update-alternatives --install /usr/bin/lua lua /usr/bin/lua5.3
        sudo update-alternatives --install /usr/bin/luac luac /usr/bin/luac5.3
        ```

    - openSUSE

        ```
        zypper in ruby-devel python-devel python3-devel perl-devel \
        lua-devel ncurses-devel libX11-devel gtk2-devel xorg-x11-devel
        ```

- Remove vim if you have it already
- Building Vim from source

    - Add/remove the flags above to fit your setup. For example, you can leave out enable-luainterp if you don't plan on writing any Lua.

        ```
        cd ~
        git clone https://github.com/vim/vim.git
        cd vim
        ./configure --with-features=huge \
                    --enable-multibyte \
                    --enable-rubyinterp \
                    --enable-pythoninterp \
                    --with-python-config-dir=/usr/lib/python2.7/config \
                    --enable-perlinterp \
                    --enable-luainterp \
                    --enable-gui=gtk2 --enable-cscope --prefix=/usr
        make
        sudo make install
        ```

    - Type the following in Vim: `:echo has('python')`. If the output is 1, then the version of Vim with Python support. If it's 0, then get a version of Vim with Python support.

#### Using vim as a python IDE

Add the following line to your .vimrc.

    Plug 'klen/python-mode', { 'for': 'python' }

Install Plugin `vim +PlugInstall +qall`

#### Using vim as a Go IDE

Add the following line to your .vimrc.

    Plug 'fatih/vim-go', { 'for': 'go' }

Install Plugin `vim +PlugInstall +qall`

FAQ
-----

### Can't build vim correctly

This wiki [Building-vim-from-source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source) may be helpful for you. 

LINKS
-----

- [vim](https://github.com/vim/vim)
- [use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
- [dotfiles](https://github.com/junegunn/dotfiles)

Contact
-----

If you have feature suggestions, please open [issues](#https://github.com/hmybmny/vimrc/issues) or [pull requests](#https://github.com/hmybmny/vimrc/pulls).

License
-----

MIT

<!-- vim: set ts=4 sw=4 et: -->
