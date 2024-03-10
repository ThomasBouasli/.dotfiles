#!/bin/bash

echo "[AWS] AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" > /dev/null
unzip awscliv2.zip > /dev/null
./aws/install > /dev/null

echo "[AWS] Cleaning up..."
rm -rf awscliv2.zip