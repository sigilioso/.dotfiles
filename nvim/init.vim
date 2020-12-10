set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
if !exists('g:vscode')
    source ~/.vim/vimrc
endif
" vscode neovim settings
if has("macunix")
    set clipboard=unnamed
else
    set clipboard=unnamedplus " requires xclip in ubuntu
endif
"Set leader to ,
:let mapleader = ","
" <leader>w to remove trailing whitespace
nmap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
