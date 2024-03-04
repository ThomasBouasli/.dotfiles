#!/bin/bash

# Dont run as sudo
if [ "$EUID" -eq 0 ]; then
    echo "Error: Do not run this script with sudo."
    exit 1
fi


# Link config files
echo "Linking config files..."
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
mkdir -p $HOME/.config
ln -sf $HOME/.dotfiles/nvim $HOME/.config
ln -sf $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
