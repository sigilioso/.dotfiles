set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
if !exists('g:vscode')
    source ~/.vim/vimrc
endif
" vscode neovim settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set sw=4
if has("macunix")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif
"Set leader to ,
:let mapleader = ","
" <leader>w to remove trailing whitespace
nmap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
