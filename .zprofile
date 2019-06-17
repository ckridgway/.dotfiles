# See .zshenv for zsh startup order information.
typeset -U path

path=(
	$HOME/bin
	$HOME/anaconda/bin
	/usr/local/bin
	/usr/local/sbin
	/usr/local/share/npm/bin
	$path[@]
	)

	
# source /Users/ckridgway/anaconda/bin/virtualenvwrapper.sh


# Setup pyenv
#export PYENV_ROOT=/usr/local/opt/pyenv
#export PATH=$PYENV_ROOT/bin:$PATH
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

