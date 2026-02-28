#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
apt_save wireshark
