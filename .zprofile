# See .zshenv for zsh startup order information.

# Set PATH, MANPATH, etc., for Hombrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -aU path

path=(
	$HOME/bin
	$HOME/.local/bin
	$path[@]
	$HOME/.lmstudio/bin
	)

# Setup pyenv
#export PYENV_ROOT=/usr/local/opt/pyenv
#export PATH=$PYENV_ROOT/bin:$PATH
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

