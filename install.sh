#!/bin/bash

echo "WARNING: This script is about to place symlinks in your home directory 
pointing to each file in this directory. If a file of the same name already 
exists in your home directory, a backup will be made with suffix \".bak\""
echo "";
read -p "Do you want to continue? (y/n) " RESP

if [ $RESP != "y" ]; then
    echo "Goodbye :)"
    exit;
fi

for file in ".zshrc" ".zsh" ".gitconfig" ".screenrc" ".emacs"
do
#    if [ "$file" != "install.sh" -a "$file" != ".git" ]; then
	echo "Found $file"
        if [ -e "$HOME/$file" -a ! -L "$HOME/$file" ]; then
            echo "Creating backup: $HOME/$file => $HOME/$file.bak"
            mv $HOME/$file $HOME/$file.bak
        fi
        ln -sfT $PWD/$file $HOME/$file
        echo "INSTALLED ~/$file"
done
