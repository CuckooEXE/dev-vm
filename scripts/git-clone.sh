#!/bin/sh
set -x

for cmd in git; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: Required command '$cmd' is not installed." >&2
        exit 1
    fi
done

mkdir /opt/sources/
for url in \
    https://github.com/python/cpython.git \
    ;
do
    (cd /opt/sources && git clone --mirror "${url}")
done
