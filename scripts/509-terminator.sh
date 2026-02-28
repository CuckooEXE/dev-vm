#!/bin/bash

set -x
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update \
    && sudo apt upgrade -y \
    && sudo apt install -y terminator
