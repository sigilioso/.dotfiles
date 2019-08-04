
install_zsh() {
  # Test to see if zshell is installed.
  if [ -z "$(command -v zsh)" ]; then
    # If zsh isn't installed, get the platform of the current machine and
    # install zsh with the appropriate package manager.
    platform=$(uname);
    if [[ $platform == 'Linux' ]]; then
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
      fi
      if [[ -f /etc/debian_version ]]; then
        sudo apt-get install zsh
      fi
    elif [[ $platform == 'Darwin' ]]; then
      brew install zsh
    fi
  fi
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! "$SHELL" == "$(command -v zsh)" ]]; then
    chsh -s "$(command -v zsh)"
  fi
}

install_fzf() {
    fzf_dir=$HOME/.fzf
    mkdir -p $fzf_dir
    wget https://raw.githubusercontent.com/junegunn/fzf/master/install -O $fzf_dir/install-fzf && chmod +x $fzf_dir/install-fzf && $fzf_dir/install-fzf
}

install_ag() {
  # Test to see if zshell is installed.
  if [ -z "$(command -v ag)" ]; then
    # If zsh isn't installed, get the platform of the current machine and
    # install zsh with the appropriate package manager.
    platform=$(uname);
    if [[ $platform == 'Linux' ]]; then
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install the_silver_searcher
      fi
      if [[ -f /etc/debian_version ]]; then
        sudo apt-get install silversearcher-ag
      fi
    elif [[ $platform == 'Darwin' ]]; then
      brew install the_silver_searcher
    fi
  fi
}
