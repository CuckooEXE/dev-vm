#!/bin/bash

set -x
set -euo pipefail

command -v wget &>/dev/null || { echo "Error: wget is required."; exit 1; }
command -v tar &>/dev/null || { echo "Error: tar is required."; exit 1; }

sudo mkdir -p /opt/dev-setup/bin/
sudo chown -R $(id -u):$(id -g) /opt/dev-setup/

wget https://github.com/sharkdp/hexyl/releases/download/v0.17.0/hexyl-v0.17.0-x86_64-unknown-linux-musl.tar.gz
tar xzf hexyl-v0.17.0-x86_64-unknown-linux-musl.tar.gz
mv hexyl-v0.17.0-x86_64-unknown-linux-musl/hexyl /opt/dev-setup/bin/
rm -rf hexyl-v0.17.0-x86_64-unknown-linux-musl.tar.gz hexyl-v0.17.0-x86_64-unknown-linux-musl/