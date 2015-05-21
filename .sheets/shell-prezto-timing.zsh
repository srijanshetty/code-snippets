#!/usr/bin/env zsh

lw=('terminal' 'editor' 'history' 'directory' 'git' 'dpkg' 'yum' 'node' 'ssh' 'tmux' 'spectrum' 'utility' 'completion' 'syntax-highlighting' 'history-substring-search' 'prompt' 'custom' 'autoenv' 'ruby' 'python' 'dwim')


for i in $lw; do
    echo $i
    time (pmodload $i)
done
