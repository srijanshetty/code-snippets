#!/usr/bin/env zsh

lw=(archive autoenv command-not-found completion custom directory dpkg dwim editor emacs environment fasd git gnu-utility gpg haskell helper history history-substring-search homebrew macports node ocaml osx pacman perl prompt python rails rsync ruby screen spectrum ssh syntax-highlighting terminal tmux utility wakeonlan yum)

for i in $lw; do
    echo $i
    time (pmodload $i)
done
