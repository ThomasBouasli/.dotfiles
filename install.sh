#!/bin/bash

# Install ZSH
echo "Installing ZSH..."
apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

## Install NeoVim
echo "Installing NeoVim..."
apt-get install software-properties-common -y
yes "" | add-apt-repository ppa:neovim-ppa/unstable
apt-get update 
apt-get install neovim -y

## Install AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -rf awscliv2.zip

## Install Github CLI
echo "Installing Github CLI..."
type -p curl >/dev/null || (apt update && apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |  dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

## Install NVM
echo "Installing NVM..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Install Node LTS
echo "Installing Node LTS..."
nvm install --lts
nvm use --lts

## Install PNPM
echo "Installing PNPM..."
npm install -g pnpm

## Install Docker
echo "Installing Docker..."

### Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

### Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

### Install the latest version of Docker Engine, containerd, and Docker Compose CLI:
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Apps

echo "Do you wish to install spotify? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) flatpak install flathub com.spotify.Client; break;;
        n ) break;;
    esac
done

echo "Do you wish to install discord? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) flatpak install flathub com.discordapp.Discord; break;;
        n ) break;;
    esac
done

echo "Do you wish to install vscode? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) flatpak install flathub com.visualstudio.code; break;;
        n ) break;;
    esac
done

echo "Do you wish to install steam? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) flatpak install flathub com.valvesoftware.Steam; break;;
        n ) break;;
    esac
done

echo "Do you wish to install chrome? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) flatpak install flathub com.google.Chrome; break;;
        n ) break;;
    esac
done

echo "Do you wish to install lutris? (y/n)"
select yn in "y" "n"; do
    case $yn in
        y ) flatpak install flathub net.lutris.Lutris; break;;
        n ) break;;
    esac
done
