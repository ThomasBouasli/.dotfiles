#!/bin/bash

echo "[Docker] Install Docker GPG key"
apt-get update > /dev/null
apt-get install ca-certificates curl > /dev/null
install -m 0755 -d /etc/apt/keyrings > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc > /dev/null
chmod a+r /etc/apt/keyrings/docker.asc > /dev/null


echo "[Docker] Add Docker repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update > /dev/null


echo "[Docker] Install Docker Engine, containerd, and Docker Compose CLI"
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null
