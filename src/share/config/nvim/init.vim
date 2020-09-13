syntax on
filetype on
filetype plugin indent on

set backspace=indent,eol,start

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
set autoread
set wildmode=longest,list
set wildignore+=*.pyc,.venv/*,*.class,**/target/*
set list
set listchars=trail:·
set laststatus=2
set statusline=%f\ %m\ \|\ %l\,%c\ \/\ %L\ (%p%%)

command! Rmsp %s/\s\+$//
map <Leader>rm :Rmsp<CR>

let g:ctrlp_working_path_mode = ''
