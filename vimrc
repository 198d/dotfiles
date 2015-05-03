call pathogen#infect()

set t_Co=256
colorscheme oceanblack256
syntax on

set noswapfile
set nobackup
set modeline
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set number
set scrolloff=10
set cursorline
set backspace=indent,eol,start
set autoread
set hidden
set wildmode=longest,list
set wildignore+=*.pyc,.venv/*
set list
set listchars=trail:·
set laststatus=2
set statusline=%f\ %m\ \|\ %l\,%c\ \/\ %L\ (%p%%)

imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-d> <end>

filetype on
filetype plugin indent on

command! Rmsp %s/\s\+$//
map <Leader>rm :Rmsp<CR>
