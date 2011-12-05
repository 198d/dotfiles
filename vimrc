set t_Co=256
colorscheme oceanblack256
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
set autoread
set hidden
set wildmode=longest,list
set wildignore+=*.pyc
set list
set listchars=trail:·

" Open files in new tabs from netrw
let g:netrw_browse_split=3
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.pyc$'

" Move cursor while in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-d> <end>

map <Leader>n :NERDTree<CR>

command! Rmsp %s/\s\+$//
map <Leader>rm :Rmsp<CR>


" Fuck some swap and backup files
set noswapfile
set nobackup

filetype on
filetype plugin on

