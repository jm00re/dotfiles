#!/bin/bash

dir=~/.dotfiles
files="zshrc vimrc tmux.conf"

cd $dir

for file in $files; do
	echo "Creating symlink to $file."
	ln -s $dir/$file ~/.$file
done
echo "Creating symlink to init.vim."
mkdir .config/nvim
ln -s $dir/init.vim ~/.config/nvim/init.vim
