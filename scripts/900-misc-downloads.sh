#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

apt_save wget

mkdir -p "${HOME}"/Downloads
cd "${HOME}"/Downloads
for url in \
    https://download.sysinternals.com/files/SysinternalsSuite.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip \
    ;
do
    wget --force-directories "${url}"
done
