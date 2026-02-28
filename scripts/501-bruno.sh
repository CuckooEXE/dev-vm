#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save curl
apt_save gpg

# Create keyrings directory
sudo mkdir -p /etc/apt/keyrings
 
# Add the Bruno repository key
curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9FA6017ECABE0266" | gpg --dearmor | sudo tee /etc/apt/keyrings/bruno.gpg > /dev/null
 
# Set permissions for the GPG key file
sudo chmod 644 /etc/apt/keyrings/bruno.gpg
 
# Add the Bruno repository
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list
 
apt_save bruno