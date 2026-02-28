#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save wget

mkdir -p "${HOME}/.local/bin"
wget https://github.com/nushell/nushell/releases/download/0.110.0/nu-0.110.0-x86_64-unknown-linux-musl.tar.gz
tar xzf nu-0.110.0-x86_64-unknown-linux-musl.tar.gz
mv nu-0.110.0-x86_64-unknown-linux-musl/nu "${HOME}/.local/bin"
rm -rf nu-0.110.0-x86_64-unknown-linux-musl.tar.gz nu-0.110.0-x86_64-unknown-linux-musl/
