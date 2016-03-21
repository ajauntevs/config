
set smarttab
set tabstop=8
set shiftwidth=4
set softtabstop=4
" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab

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
set noesckeys

set laststatus=2
au FileType mail set tw=76

set background=light
set t_Co=256
let base16colorspace=256

set splitbelow
set splitright

filetype plugin indent on
syntax enable
syntax on

map <F2> :NERDTreeToggle<CR>
map <F5> :ToggleBG<CR>

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>

nmap <silent> <A-n> :nohlsearch<CR>

colorscheme base16-solarized

