#!/usr/bin/env bash
#------------------------------------------------------------------------------
#
# Developed in Iowa by Chris Ridgway 
#
# DESCRIPTION:
#   Bootstraps my home directory in Unix like OSes (OSX and Linux). Derived 
#   from my original Python version (circa 2013).
#
# REQUIRES:
#   - bash
#
# USAGE:
#   ./bootstrap.sh
#
#------------------------------------------------------------------------------
OS=$(uname -s)
OS_SUFFIX="linux"

#------------------------------------------------------------------------------
# If we're on OSX then it's likely we don't have a package manager 
# installed. Install my preferred manager: [Homebrew](http://brew.sh)
#------------------------------------------------------------------------------
if [ "$OS" == 'Darwin' ]
then
    OS_SUFFIX="osx"

    if [ ! -x "$(which brew)" ]; then
        echo "Homebrew not installed. Installing..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi 

    #echo "Updating brew..."
    #brew update

    PKG_MANAGER=$(which brew)

    # Change the finder to show hidden files
    defaults write com.apple.finder AppleShowAllFiles YES
fi

#------------------------------------------------------------------------------
# If we're not on OSX, try finding the appropriate package manager...
#------------------------------------------------------------------------------
[ ! -x "$PKG_MANAGER" ] && PKG_MANAGER=$(which apt-get)
[ ! -x "$PKG_MANAGER" ] && PKG_MANAGER=$(which rpm)
[ ! -x "$PKG_MANAGER" ] && PKG_MANAGER=$(which yum)
[ ! -x "$PKG_MANAGER" ] && echo "** error: No package manager found!!" && exit -1

PKG_MANAGER=${PKG_MANAGER##*/}

#------------------------------------------------------------------------------
# Install some useful packages for installing things
#------------------------------------------------------------------------------
[ ! -x "$(which git)" ] && $($PKG_MANAGER install git)
[ ! -x "$(which curl)" ] && $($PKG_MANAGER install curl)
[ ! -x "$(which wget)" ] && $($PKG_MANAGER install wget)

#------------------------------------------------------------------------------
# Establish backup directory before copying/symlinking.
#------------------------------------------------------------------------------
BACKUP_DIR=$HOME/.dotfiles_backup/$(date +%F+%T)
mkdir -p $BACKUP_DIR || exit -2

#------------------------------------------------------------------------------
# Make .local directories
#------------------------------------------------------------------------------
mkdir -p $HOME/.local/src
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share
mkdir -p $HOME/.local/state
mkdir -p $HOME/.local/etc
mkdir -p $HOME/.local/lib
mkdir -p $HOME/.local/include

#------------------------------------------------------------------------------
# Clone dotfiles
#------------------------------------------------------------------------------
git clone --bare git@github.com:ckridgway/.dotfiles.git $HOME/.dotfiles

function config {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout
if [ $? != 0 ]; then
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "^\s+.*" | awk {'print $1'} | xargs -I{} mv {} $BACKUP_DIR/{}
fi;

config checkout
config config status.showUntrackedFiles no

#------------------------------------------------------------------------------
# Install topical packages
#------------------------------------------------------------------------------
PKGS1=$(find $HOME/.local/src/dotfiles_bootstrap -name "install-$OS_SUFFIX.sh")
PKGS2=$(find $HOME/.local/src/dotfiles_bootstrap -name "install.sh")

for x in $PKGS1 $PKGS2
do  
    source $x
done 
