#!/bin/bash
# Source: https://gist.github.com/ryin/3106801
# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.
 
# exit on error
set -e
 
TMUX_VERSION=1.9
 
# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp
 
# download source files for tmux, libevent, and ncurses
wget -O tmux-${TMUX_VERSION}.tar.gz http://sourceforge.net/projects/tmux/files/tmux/tmux-${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz/download
wget --no-check-certificate https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz
 
# extract files, configure, and compile
 
############
# libevent #
############
tar xvzf libevent-2.0.21-stable.tar.gz
cd libevent-*
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..
 
############
# ncurses  #
############
tar xvzf ncurses-5.9.tar.gz
cd ncurses-*
./configure --prefix=$HOME/local
make
make install
cd ..
 
############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..
 
# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
# e.g. to export path
# export PATH=$PATH:/path/to/dir1