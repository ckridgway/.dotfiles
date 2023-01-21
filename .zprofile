# See .zshenv for zsh startup order information.

# Set PATH, MANPATH, etc., for Hombrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -aU path

path=(
	$HOME/bin
	$path[@]
	)

	
# source /Users/ckridgway/anaconda/bin/virtualenvwrapper.sh


# Setup pyenv
#export PYENV_ROOT=/usr/local/opt/pyenv
#export PATH=$PYENV_ROOT/bin:$PATH
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

