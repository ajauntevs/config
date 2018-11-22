
set smarttab
set tabstop=8
set shiftwidth=4
set softtabstop=4
" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab

set hi=100
set nu
set ruler
set relativenumber
set showcmd

set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

set backspace=2

set autoindent
set formatoptions=c,q,r,t

set laststatus=2
au FileType mail set tw=76

set t_Co=256

set splitbelow
set splitright

filetype plugin indent on
syntax enable
syntax on

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>

nnoremap <silent> <C-n> :nohlsearch<CR>


call plug#begin('~/.config/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mileszs/ack.vim'
Plug 'justinmk/vim-sneak'
call plug#end()

map <F2> :NERDTreeToggle<CR>
map <F5> :ToggleBG<CR>

set background=light
colorscheme PaperColor

map <C-K> :pyf /home/aleksis/clang-format.py<cr>
imap <C-K> <c-o>:pyf /home/aleksis/clang-format.py<cr>

let g:ackprg = 'ag --vimgrep'

function FormatFile()
    let l:lines="all"
    pyf /home/aleksis/clang-format.py
endfunction

map <C-I> :call FormatFile()<cr>

