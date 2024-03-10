#!/bin/bash

echo "[NODE] Install NVM"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "[NVM] Load NVM"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


echo "[NODE] Install LTS"
nvm install --lts
nvm use --lts

echo "[NODE] Install pnpm"
npm install -g pnpm
