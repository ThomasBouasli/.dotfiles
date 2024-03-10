#!/bin/bash

echo "[Flatpak] Installing flatpak"
apt install flatpak

echo "[Flatpak] Adding flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

install_application() {
    read -p "[Flatpak] Do you wish to install $1? (y/n): " response
    if [ "$response" == "y" ]; then
        flatpak install flathub $2
    fi
}

read -p "[Flatpak] Do you wish to install Spotify? (y/n): " response
if [ "$response" == "y" ]; then
    flatpak install flathub com.spotify.Client
fi

read -p "[Flatpak] Do you wish to install Discord? (y/n): " response
if [ "$response" == "y" ]; then
    flatpak install flathub com.discordapp.Discord
fi

read -p "[Flatpak] Do you wish to install VSCode? (y/n): " response
if [ "$response" == "y" ]; then
    flatpak install flathub com.visualstudio.code
fi

read -p "[Flatpak] Do you wish to install Steam? (y/n): " response
if [ "$response" == "y" ]; then
    flatpak install flathub com.valvesoftware.Steam
fi

read -p "[Flatpak] Do you wish to install Chrome? (y/n): " response
if [ "$response" == "y" ]; then
    flatpak install flathub com.google.Chrome
fi

read -p "[Flatpak] Do you wish to install Lutris? (y/n): " response
if [ "$response" == "y" ]; then
    flatpak install flathub net.lutris.Lutris
fi
