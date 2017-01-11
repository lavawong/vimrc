" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2006 Aug 12
" This is Adwards Wang vimrc file
" Last change:  2012-03-06 
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'syntastic'
Plugin 'nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"""""""""""""""""""""""""""
" Git-gutter configuration
"""""""""""""""""""""""""""

let g:gitgutter_updatetime = 750
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1


"""""""""""""""""""""""""""
" Syntastic configuration
"""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""
" NERDTree configuration
"""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""
" Show Space and TAB 
" http://askubuntu.com/questions/74485/how-to-display-hidden-characters-in-vim
"""""""""""""""""""""""""""""
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" so that syntastic uses .jshintrc files if present - http://stackoverflow.com/questions/28573553/how-can-i-make-syntastic-load-a-different-checker-based-on-existance-of-files-in
autocmd FileType javascript let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['standard']

" execute pathogen#infect()

set wildignore=.git/**,log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                 
                      " show a navigable menu for tab completion
set wildmode=longest,list,full

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup
" if has("vms")
" set nobackup        " do not keep a backup file, use versions instead
" else
" set backup        " keep a backup file
" endif
set ignorecase
set history=50          " keep 50 lines of command line history
set ruler          " show the cursor position all the time
set showcmd          " display incomplete commands
set incsearch          " do incremental searching
set shiftwidth=4
set tabstop=4
set expandtab
set modeline
set autochdir
set autoindent
set number
set ls=2
" set statusline=%4*%<\ %1*[%F]
" set statusline+=%4*\ %5*[%{&fileencoding}, " encoding
" set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
" set statusline+=%4*%=\ %6*%y%4*\ [POS=%4*%l,%3*%c]\ \<PER=%2*%P%4*\>
set encoding=utf-8
let &termencoding=&encoding
set paste
autocmd FileType py,c,cpp,java set shiftwidth=4 | set expandtab
autocmd BufNewFile,BufRead *.node set filetype=javascript
set langmenu=zh_CN.UTF-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" colorscheme mustang
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
nnoremap <F4> :call g:Jsbeautify()
" In an xterm the mouse should work quite well, thus enable it.
set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax enable
syntax on
set hlsearch

if &diff
    " diff mode
    set diffopt+=iwhite
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    augroup END

else

    set autoindent        " always set autoindenting on

endif " has("autocmd")

    " Convenient command to see the difference between the current buffer and the
    " file it was loaded from, thus the changes you made.
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
let Tlist_Inc_Winwidth=0
let mapleader=","
" setlocal foldlevel=1
" open javascript fold
" let b:javascript_fold=1
" surpport javascript in dom, html, css
" left javascript_enable_domhtmlcss=1
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

let g:investigate_command_for_python = '/usr/bin/zeal ^s'
:nnoremap gz :!zeal "<cword>"&<CR><CR>
