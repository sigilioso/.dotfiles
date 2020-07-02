#!/bin/bash
git submodule update --init --recursive

source ./install-deps.sh

install_zsh
install_fzf
install_ag
install_autojump

echo "Installing fonts..."
sh install-fonts.sh

dotfiles_dir=`pwd`
echo "Dotfiles dir: $dotfiles_dir"

# link zsh / oh-my-zsh configuration
echo "Setting up shell..."

[ ! -e $HOME/.oh-my-zsh ] && ln -sf $dotfiles_dir/shell/oh-my-zsh $HOME/.oh-my-zsh
[ ! -e $HOME/.zshrc ] && ln -sf $dotfiles_dir/shell/zshrc $HOME/.zshrc

# link vim config
echo "Setting up vim config..."
[ ! -e $HOME/.vim ] && ln -sf $dotfiles_dir/vim $HOME/.vim
vim -c "PlugInstall"

# .git configuration
echo "Setting up git config..."
[ ! -e $HOME/.gitignore_global ] && ln -sf $dotfiles_dir/git/gitignore_global $HOME/.gitignore_global
[ ! -e $HOME/.gitconfig.static ] && ln -sf $dotfiles_dir/git/gitconfig.static $HOME/.gitconfig.static
git config --global include.path $HOME/.gitconfig.static
echo 'Remember to setup user and email:'
echo '    git config --global user.name "YOUR NAME"'
echo '    git config --global user.email your@email'
