dotfiles_dir=$1
# Install zsh
# on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Remainders
echo "**************************"
echo "Close your session and open it again if zsh wasn't the default shell before"
echo "**************************"
echo "We need to execute p10k in zsh if it doesn't start automatically"
echo "**************************"
