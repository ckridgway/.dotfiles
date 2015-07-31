#!/usr/bin/env bash
#------------------------------------------------------------------------------
#
# Developed in Iowa by Chris Ridgway.
#
# DESCRIPTION:
# Bootstraps my home directory in Unix like OSes (OSX and Linux).
#
# REQUIRES:
#   - bash
#
# USAGE:
# ./bootstrap.sh
#
#------------------------------------------------------------------------------
OS=$(uname -s)
OS_SUFFIX='linux'

#------------------------------------------------------------------------------
# If we're on OSX then it's likely we don't have a package manager 
# installed. If that's the case, install my preferred manager: 
#
#   [Homebrew](http://brew.sh). 
#------------------------------------------------------------------------------
if [ "$OS" == 'Darwin' ]
then
    if [ ! -x "$(which brew)" ]; then
        echo "Homebrew not installed. Installing..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi 

    echo "Updating brew..."
    #brew update

    PKG_MANAGER=$(which brew)
    OS_SUFFIX='osx'
fi

#------------------------------------------------------------------------------
# If we're not on OSX, try finding the appropriate package manager...
#------------------------------------------------------------------------------
[ ! -x "$PKG_MANAGER" ] && PKG_MANAGER=$(which apt-get)
[ ! -x "$PKG_MANAGER" ] && PKG_MANAGER=$(which rpm)
[ ! -x "$PKG_MANAGER" ] && PKG_MANAGER=$(which yum) 
[ ! -x "$PKG_MANAGER" ] && echo "** error: No package manager found!!" && exit -1

#------------------------------------------------------------------------------
# Install packages
#------------------------------------------------------------------------------
PKGS1=$(find $PWD -name "*.install")
PKGS2=$(find $PWD -name "*.install-$OS_SUFFIX") 

for x in $PKGS1 $PKGS2
do    
    filename=${x##*/}
    pkg_name=${filename%.install*}
    echo "Installing $pkg_name..." && $($PKG_MANAGER install $pkg_name)
done 

#------------------------------------------------------------------------------
# Establish backup directory before copying/symlinking.
#------------------------------------------------------------------------------
BACKUP_DIR=$(PWD)/backup/$(date +%F+%T)
mkdir -p $BACKUP_DIR || exit -2

#------------------------------------------------------------------------------
# Setup symlinks. Make backups of the original files.
#------------------------------------------------------------------------------
SYMS1=$(find $PWD -name "*.symlink")
SYMS2=$(find $PWD -name "*.symlink-$OS_SUFFIX")

for src in $SYMS1 $SYMS2
do
    filename=${src##*/}
    linkname=${filename%.symlink*}
    dst=~/$linkname

    [ -e "$dst" ] && cp $dst $BACKUP_DIR/$linkname

    ln -fs $src $dst
done

