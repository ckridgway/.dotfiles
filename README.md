# Introduction
This is my dofiles bootstrapper. It sets up my user account on new OSX and Linux based PCs just the way I want. 

### WARNING
I haven't really tested this much on Linux at this time, just OSX.

# Install
Run:

```
  git clone https://github.com/ckridgway/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  ./bootstrap.sh
```

This will:
  - Install favorite packages appropriate for OS
  - Setup my environment with my most important settings
  - Backup any replaced files into `~/.dotfiles/backup/<Date+Time>`

# Conventions
## Topics
The directory structure is topical.  
  
## File Extensions
Files with the following extensions have special meaning:
  - `.symlink` files are symlinked into `~`
  - `.copy` files are copied into `~`
  - `.bin` files are copied into `~/bin`
  - `.install` files are installed via the OS appropriate package manager

File extensions can include OS filters that restrict it to a specific OS. These take the following form:
```
  <name>.<operation>[-<os>]
```
where:
  - `name` is a filename or package name
  - `operation` is what to do (`symlink`, `copy`, `bin`, `install`)
  - `os` restricts the operation to the specified OS (`osx` or `linux)
examples:
```
  zsh.install           # install on all OSes
  zsh.install-osx       # install only on OSX
  .zshrc.symlink        # symlink .zshrc.symlink into ~ as .zshrc
  .zshrc.copy-linux     # copy .zshrc.symlink into ~ as .zshrc
```

# Credits
  - [GitHub Dotfiles](https://dotfiles.github.io/) for introducing the concept of managed dotfiles
  - [Zach Holman](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) for the topical organization idea and some other ideas.
