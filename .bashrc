#export PS1="\[\e[1m\]_______________________________________________________________________\[\e[0m\]\n\[\e[1;30;47m\]| \w @ \h (\u) \[\e[0m\]\n| => "

#export PS2="\[\e[1;30;47m\]| => \[\e[0m\] "

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias h="history"


# .dotfile management - see https://github.com/ckridgway/.dotfiles
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"