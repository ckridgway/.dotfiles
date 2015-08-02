[ "$PKG_MANAGER" == "brew" ] && brew install zsh
[ "$PKG_MAANGER" == "apt-get" ] && sudo apt-get install zsh

# Install oh-my-zsh also: depenencies on git and curl or wget
# [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
