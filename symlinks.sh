#!/bin/bash     
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles    # dotfiles directory
files="vimrc vim zshrc oh-my-zsh tmux.conf"    # list of files/folders to symlink in homedir

##########

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -hfs $dir/$file ~/.$file
done
echo "...done"
