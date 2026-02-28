#!/bin/bash

set -x
set -euo pipefail

command -v curl &>/dev/null || { echo "Error: curl is required."; exit 1; }

sudo mkdir -p /opt/dev-setup/deb/
sudo chown -R $(id -u):$(id -g) /opt/dev-setup/

# Create keyrings directory
sudo mkdir -p /etc/apt/keyrings
 
# Update and install GPG and curl
sudo apt update && sudo apt install gpg curl
 
# List existing keys (optional)
sudo gpg --list-keys
 
# Add the Bruno repository key
curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9FA6017ECABE0266" | gpg --dearmor | sudo tee /etc/apt/keyrings/bruno.gpg > /dev/null
 
# Set permissions for the GPG key file
sudo chmod 644 /etc/apt/keyrings/bruno.gpg
 
# Add the Bruno repository
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list
 
# Update and install Bruno
sudo apt update && sudo apt install -y bruno && sudo apt-get install --download-only -y bruno

mv /var/cache/apt/archives/*.deb /opt/dev-setup/deb/