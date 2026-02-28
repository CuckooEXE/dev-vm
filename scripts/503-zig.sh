#!/bin/bash

set -x
set -euo pipefail

command -v curl &>/dev/null || { echo "Error: curl is required."; exit 1; }

curl https://www.zvm.app/install.sh | bash
zvm install 0.15.2
