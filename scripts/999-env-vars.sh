#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

echo 'export PATH="$HOME/.local/bin:$HOME/.zvm/bin:$HOME/.zvm/self:$PATH"' | sudo tee /etc/profile.d/local-bin.sh
