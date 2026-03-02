#!/bin/bash

set -x
set -euo pipefail

apt_save() {
    export DEBIAN_FRONTEND=noninteractive
    local PACKAGE="${1}"
    local SAVE_DIR="${HOME}/Desktop/apt"

    if [[ -z "$PACKAGE" ]]; then
        echo "Usage: apt_save <package_name>"
        return 1
    fi

    [ ! -d "${SAVE_DIR}" ] && mkdir -p "${SAVE_DIR}"
    if ! dpkg -l | grep -qw "$PACKAGE"; then
        sudo apt-get update
        sudo apt-get install -y --download-only \
            -o Dir::Cache::archives="$SAVE_DIR" \
            "$PACKAGE"
        sudo apt-get install -y "$PACKAGE"
    fi
}

require_cmds() {
    for cmd in "$@"; do
        command -v "${cmd}" &>/dev/null || { echo "Error: ${cmd} is required."; exit 1; }
    done
}
