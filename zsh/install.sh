[ "$PKG_MANAGER" == "brew" ] && brew install zsh zsh-completions antigen
[ "$PKG_MAANGER" == "apt-get" ] && sudo apt-get install zsh zsh-completions antigen

# Install oh-my-zsh also: depenencies on git and curl or wget
# [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
