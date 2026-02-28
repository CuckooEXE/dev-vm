#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

exit 0

require_cmds docker

for img in \
    ghcr.io/freecodecamp/devdocs:latest \
    debian:9.0 \
    debian:trixie \
    debian:latest \
    alpine:3.23.3 \
    alpine:latest \
    centos:centos5 \
    centos:centos7.9.2009 \
    rockylinux/rockylinux:8.4-rc1 \
    rockylinux/rockylinux:10.1.20251123 \
    kalilinux/kali-rolling:latest \
    remnux/remnux-distro:latest \
    node:lts-alpine \
    postgres:alpine \
    nginx:alpine \
    mongo:8.2-rc \
    redis:8.4.2-trixie \
    technitium/dns-server:14.3.0 \
    radare/radare2:latest \
    ;
do
    sudo docker image pull "${img}"
done
