#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save wget

mkdir -p "${HOME}/.local/bin"
wget https://github.com/sharkdp/hexyl/releases/download/v0.17.0/hexyl-v0.17.0-x86_64-unknown-linux-musl.tar.gz
tar xzf hexyl-v0.17.0-x86_64-unknown-linux-musl.tar.gz
mv hexyl-v0.17.0-x86_64-unknown-linux-musl/hexyl "${HOME}/.local/bin"
rm -rf hexyl-v0.17.0-x86_64-unknown-linux-musl.tar.gz hexyl-v0.17.0-x86_64-unknown-linux-musl/