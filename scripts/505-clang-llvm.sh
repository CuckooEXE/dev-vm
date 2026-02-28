#!/bin/bash

set -x
set -euo pipefail

command -v wget &>/dev/null || { echo "Error: wget is required."; exit 1; }

bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
