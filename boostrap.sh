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
OS_SUFFIX='linux'

#------------------------------------------------------------------------------
# If we're on OSX then it's likely we don't have a package manager 
# installed. Install my preferred manager: [Homebrew](http://brew.sh)
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

PKG_MANAGER=${PKG_MANAGER##*/}

#------------------------------------------------------------------------------
# Install some useful packages for installing things
#------------------------------------------------------------------------------
$($PKG_MANAGER install git)
$($PKG_MANAGER install curl)
$($PKG_MANAGER install wget)

#------------------------------------------------------------------------------
# Install packages
#------------------------------------------------------------------------------
PKGS=$(find $PWD -name "install.sh")

for x in $PKGS
do  
    source $x
done 

#------------------------------------------------------------------------------
# Establish backup directory before copying/symlinking.
#------------------------------------------------------------------------------
BACKUP_DIR=$PWD/backup/$(date +%F+%T)
mkdir -p $BACKUP_DIR || exit -2

#------------------------------------------------------------------------------
# Copy files.
#------------------------------------------------------------------------------
COPY1=$(find $PWD -name "*.copy")
COPY2=$(find $PWD -name "*.copy-$OS_SUFFIX")

for src in $COPY1 $COPY2
do
    filename1=${src##*/}
    filename2=${filename1%.copy*}
    dst=~/$filename2

    [ -e "$dst" ] && cp $dst $BACKUP_DIR/$filename2

    cp $src $dst
done

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

