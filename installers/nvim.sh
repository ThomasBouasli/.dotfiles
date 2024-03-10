#!/bin/bash

echo "[NeoVim] ppa for neovim"
apt-get install software-properties-common -y > /dev/null
yes "" | add-apt-repository ppa:neovim-ppa/unstable > /dev/null
apt-get update -y > /dev/null

echo "[NeoVim] neovim"
apt-get install neovim -y > /dev/null
