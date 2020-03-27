
install_zsh() {
  # Test to see if zshell is installed
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
    # Test to see if fzf is installed
    if [ -z "$(command -v fzf)" ]; then
        fzf_dir=$HOME/.fzf
        mkdir -p $fzf_dir
        git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
        $fzf_dir/install
    fi
}

install_ag() {
  # Test to see if ag is installed
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

install_autojump() {
  if [ -z "$(command -v autojump)" ]; then
    git clone git://github.com/wting/autojump.git /tmp/autojump && cd /tmp/autojump && python install.py
  fi
}
