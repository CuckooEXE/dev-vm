#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save wget

mkdir -p "${HOME}/.local/bin"
wget https://github.com/sharkdp/hyperfine/releases/download/v1.20.0/hyperfine-v1.20.0-x86_64-unknown-linux-musl.tar.gz
tar xzf hyperfine-v1.20.0-x86_64-unknown-linux-musl.tar.gz
mv hyperfine-v1.20.0-x86_64-unknown-linux-musl/hyperfine "${HOME}/.local/bin"
rm -rf hyperfine-v1.20.0-x86_64-unknown-linux-musl.tar.gz hyperfine-v1.20.0-x86_64-unknown-linux-musl/
