#!/bin/bash
set -x
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update \
    && sudo apt upgrade -y \
    && sudo apt install -y git

sudo mkdir -p /opt/dev-setup/downloads/
sudo chown -R $(id -u):$(id -g) /opt/dev-setup/
cd /opt/dev-setup/downloads/

wget \
  
for url in \
    https://download.sysinternals.com/files/SysinternalsSuite.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip \
    ;
do
    wget --force-directories "${url}"
done
