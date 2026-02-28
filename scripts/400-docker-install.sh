#!/bin/bash

set -x
set -euo pipefail

command -v curl &>/dev/null || { echo "Error: curl is required."; exit 1; }

sudo mkdir -p /opt/dev-setup/deb/
sudo chown -R $(id -u):$(id -g) /opt/dev-setup/

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

sudo apt-get install --download-only -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
mv /var/cache/apt/archives/*.deb /opt/dev-setup/deb/