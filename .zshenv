# ZSH startup files are sourced in the following order:
# 1) .zshenv (this file)
# 2) .zprofile - if login shell
# 3) .zshrc - if interactive shell
# 4) .zlogin - if login shell
# 5) .zlogout - any logout cleanup
#
# .zshenv is the first file to be read on zsh startup.
# It is always read.
# It is intended for setting user environment variables. 
# It should NOT contain any commands that produce output.
#
# .zprofile - recommend PATH updates go here, rather than in .zshenv
#  so they don't cause problems with any system functions.
#
# .zshrc - put aliases, functions, options, key bindings, etc.
# 
# .zlogin - set the terminal type and run commands

export SSH_AUTH_SOCK=~/.1password/agent.sock

[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env

