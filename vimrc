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
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&fileencoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ [POS=%4*%l,%3*%c]\ \<PER=%2*%P%4*\>
set encoding=utf-8
let &termencoding=&encoding
set paste
autocmd FileType py,c,cpp,java set shiftwidth=4 | set expandtab
autocmd BufNewFile,BufRead *.node set filetype=javascript
set langmenu=zh_CN.UTF-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
syntax enable
syntax on
colorscheme mustang
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
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif

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
