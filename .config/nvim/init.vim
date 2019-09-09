
set smarttab
set tabstop=8
set shiftwidth=4
set softtabstop=4
" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab

set history=100
set number
set ruler
set relativenumber
set signcolumn=no
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

set splitbelow
set splitright

set termguicolors
filetype plugin indent on
syntax enable
syntax on

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'justinmk/vim-sneak'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

let g:deoplete#enable_at_startup = 1

set hidden

let g:LanguageClient_serverCommands = {
  \ 'cpp' : ['clangd'],
  \ }

map <F2> :NERDTreeToggle<CR>
map <F5> :ToggleBG<CR>

set background=light
colorscheme PaperColor

map <C-K> :py3f /home/aleksis/clang-format.py<cr>
imap <C-K> <c-o>:py3f /home/aleksis/clang-format.py<cr>

let g:ackprg = 'ag --vimgrep'

function FormatFile()
    let l:lines="all"
    py3f /home/aleksis/clang-format.py
endfunction

map <C-I> :call FormatFile()<cr>

