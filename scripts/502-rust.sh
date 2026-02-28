#!/bin/bash

set -x
set -euo pipefail

command -v curl &>/dev/null || { echo "Error: curl is required."; exit 1; }

sudo mkdir -p /opt/dev-setup/bin/
sudo chown -R $(id -u):$(id -g) /opt/dev-setup/

export CARGO_HOME="/opt/dev-setup/rust/"
export RUSTUP_HOME="/opt/dev-setup/rust/"
curl https://sh.rustup.rs -sSf | sh -s -- -y
