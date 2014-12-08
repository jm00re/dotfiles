#!/bin/bash

dir=~/.dotfiles
files="zshrc vimrc tmux.conf"

cd $dir

for file in $files; do
	echo "Creating symlink to $file in home dir."
	ln -s $dir/$file ~/.$file
done
