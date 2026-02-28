#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save wget

mkdir -p "${HOME}/.local/bin"
wget https://github.com/sharkdp/fd/releases/download/v10.3.0/fd-v10.3.0-x86_64-unknown-linux-musl.tar.gz
tar xzf fd-v10.3.0-x86_64-unknown-linux-musl.tar.gz
mv fd-v10.3.0-x86_64-unknown-linux-musl/fd "${HOME}/.local/bin"
rm -rf fd-v10.3.0-x86_64-unknown-linux-musl.tar.gz fd-v10.3.0-x86_64-unknown-linux-musl/
