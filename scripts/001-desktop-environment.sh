#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save xfce4
apt_save xfce4-goodies
sudo systemctl set-default graphical.target