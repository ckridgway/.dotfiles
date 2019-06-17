# Introduction
This is my dofiles bootstrapper. It uses git to manage dotfiles. Branches are used for different machine and os configurations.

### WARNING
I haven't really tested this much on Linux at this time, just OSX.

# Install
Run:
```zsh
curl -Lks https://git.io/fja4U | sh
```

This will:
  - install dependencies (brew, git, curl, wget)
  - setup config alias
  - clone .dotfiles to `$HOME/.dotfiles`
  - checkout working copy to $HOME
  - backup any replaced files into `$HOME/.dotfiles_backup/<Date+Time>`

# Credits
  - [GitHub Dotfiles](https://dotfiles.github.io/) for introducing the concept of managed dotfiles
  - Nicola Paolucci for his [cfg project](https://bitbucket.org/durdn/cfg/src/master/) and [tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
  - StreakyCobra for sharing the concept in a Hacker News [post](https://news.ycombinator.com/item?id=11071754)
