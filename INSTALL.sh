#!/bin/bash

DIR=$(dirname $0)

hide_output() {
    "$@" > /dev/null 2>&1
}

# Install ZSH
echo "Installing ZSH..."
hide_output apt install zsh -y
yes "y" | hide_output sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
hide_output git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
hide_output git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
hide_output git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
hide_output chsh -s $(which zsh)

## Install NeoVim
echo "Installing NeoVim..."
hide_output apt-get install software-properties-common -y
yes "" | hide_output add-apt-repository ppa:neovim-ppa/unstable
hide_output apt-get update 
hide_output apt-get install neovim -y

## Install AWS CLI
echo "Installing AWS CLI..."
hide_output curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
hide_output unzip awscliv2.zip
hide_output ./aws/install
hide_output rm -rf awscliv2.zip

## Install Github CLI
echo "Installing Github CLI..."
hide_output type -p curl >/dev/null || (apt update && apt install curl -y)
hide_output curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |  hide_output dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& hide_output chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& hide_output echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& hide_output apt update \
&& hide_output apt install gh -y

## Install NVM
echo "Installing NVM..."
hide_output wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

hide_output export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Install Node LTS
echo "Installing Node LTS..."
hide_output nvm install --lts
hide_output nvm use --lts

## Install PNPM
echo "Installing PNPM..."
hide_output npm install -g pnpm

## Install Docker
echo "Installing Docker..."

### Add Docker's official GPG key:
hide_output apt-get update
hide_output apt-get install ca-certificates curl
hide_output install -m 0755 -d /etc/apt/keyrings
hide_output curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
hide_output chmod a+r /etc/apt/keyrings/docker.asc

### Add the repository to Apt sources:
hide_output echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  hide_output tee /etc/apt/sources.list.d/docker.list > /dev/null
hide_output apt-get update

### Install the latest version of Docker Engine, containerd, and Docker Compose CLI:
hide_output apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Link config files
echo "Linking config files..."
hide_output ln -sf ${DIR}/.zshrc ~/.zshrc
hide_output mkdir -p ~/.config
hide_output ln -sf ${DIR}/nvim ~/.config
hide_output ln -sf ${DIR}/.p10k.zsh ~/.p10k.zsh
hide_output ln -sf ${DIR}/.gitconfig ~/.gitconfig

# Install Apps

echo "Do you wish to install spotify? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) hide_output flatpak install flathub com.spotify.Client; break;;
        n ) break;;
    esac
done

echo "Do you wish to install discord? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) hide_output flatpak install flathub com.discordapp.Discord; break;;
        n ) break;;
    esac
done

echo "Do you wish to install vscode? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) hide_output flatpak install flathub com.visualstudio.code; break;;
        n ) break;;
    esac
done

echo "Do you wish to install steam? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) hide_output flatpak install flathub com.valvesoftware.Steam; break;;
        n ) break;;
    esac
done

echo "Do you wish to install chrome? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) hide_output flatpak install flathub com.google.Chrome; break;;
        n ) break;;
    esac
done

echo "Do you wish to install lutris? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) hide_output flatpak install flathub net.lutris.Lutris; break;;
        n ) break;;
    esac
done
