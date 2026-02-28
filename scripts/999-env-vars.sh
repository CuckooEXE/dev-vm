#!/bin/bash
set -x
set -euo pipefail

echo "/opt/dev-setup/lib" | sudo tee /etc/ld.so.conf.d/dev-setup.conf
echo "/opt/dev-setup/lib64" | sudo tee -a /etc/ld.so.conf.d/dev-setup.conf
sudo ldconfig

for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
    echo 'export DEV_SETUP="/opt/dev-setup"' >> "${rc}"
    echo 'export PATH="$DEV_SETUP/bin:$DEV_SETUP/sbin:$PATH"' >> "${rc}"
    echo 'export LD_LIBRARY_PATH="$DEV_SETUP/lib:$DEV_SETUP/lib64:$LD_LIBRARY_PATH"' >> "${rc}"
    echo 'export LIBRARY_PATH="$DEV_SETUP/lib:$DEV_SETUP/lib64:$LIBRARY_PATH"' >> "${rc}"
    echo 'export C_INCLUDE_PATH="$DEV_SETUP/include:$C_INCLUDE_PATH"' >> "${rc}"
    echo 'export CPLUS_INCLUDE_PATH="$DEV_SETUP/include:$CPLUS_INCLUDE_PATH"' >> "${rc}"
    echo 'export PKG_CONFIG_PATH="$DEV_SETUP/lib/pkgconfig:$DEV_SETUP/share/pkgconfig:$PKG_CONFIG_PATH"' >> "${rc}"
done
