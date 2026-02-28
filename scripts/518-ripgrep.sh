#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save wget

mkdir -p "${HOME}/.local/bin"
wget https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
tar xzf ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
mv ripgrep-15.1.0-x86_64-unknown-linux-musl/rg "${HOME}/.local/bin"
rm -rf ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz ripgrep-15.1.0-x86_64-unknown-linux-musl/
