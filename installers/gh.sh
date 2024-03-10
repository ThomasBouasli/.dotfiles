#!/bin/bash

echo "[GH] Add GPG key"
type -p curl >/dev/null || (apt update && apt install curl -y) > /dev/null
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |  dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update > /dev/null

echo "[GH] Install GH CLI"
apt install gh -y > /dev/null