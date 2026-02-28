#!/bin/bash

if sudo command -v cloud-init &> /dev/null; then
    echo "Waiting for cloud-init to finish"
    sudo cloud-init status --wait  || true
fi
