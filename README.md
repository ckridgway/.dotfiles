# Introduction
This is my dofiles bootstrapper. It uses git to manage dotfiles. Branches are used for different machine and os configurations.

### WARNING
I haven't really tested this much on Linux at this time, just OSX.

# Install
Run:
```zsh
curl -Lks https://github.com/ckridgway/dotfiles.git/.dotfiles_support/bootstrap.sh | sh
```

This will:
  - install dependencies (brew, git, curl, wget)
  - setup config alias
  - clone .dotfiles to `$HOME/.dotfiles`
  - checkout working copy to $HOME
  - backup any replaced files into `$HOME/.dotfiles_backup/<Date+Time>`

# Credits
  - [GitHub Dotfiles]() for introducing the concept of managed dotfiles
  - [Nicola Paolucci]() for his cfg project and [article]() on Atlassian tutorials
  - [StreakyCobra]() for describing his setup on Hacker News

[GitHub Dotfiles]: https://dotfiles.github.io/                     
[Nicola Paolucci]: https://bitbucket.org/durdn/cfg/src/master/     
[tutorial]: https://www.atlassian.com/git/tutorials/dotfiles
[StreakyCobra]: https://news.ycombinator.com/item?id=11071754
[article]: https://www.atlassian.com/git/tutorials/dotfiles
