colorscheme darkblue
syntax on

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set number
set scrolloff=10
set cursorline
set backspace=indent,eol,start

" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Open files in new tabs from netrw
let g:netrw_browse_split=3
let g:netrw_liststyle=3

" Move cursor while in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-d> <end>

" Fuck some swap and backup files
set noswapfile
set nobackup

