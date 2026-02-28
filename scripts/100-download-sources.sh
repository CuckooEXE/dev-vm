#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

exit 0

apt_save git

mkdir -p "${HOME}/Desktop/Sources"
cd "${HOME}/Desktop/Sources"

for url in \
    https://github.com/torvalds/linux.git \
    https://github.com/llvm/llvm-project.git \
    https://github.com/python/cpython.git \
    git://sourceware.org/git/binutils-gdb.git \
    https://github.com/file/file.git \
    https://git.savannah.gnu.org/git/make.git \
    https://git.savannah.gnu.org/git/nano.git \
    https://github.com/vim/vim.git \
    https://github.com/the-tcpdump-group/tcpdump.git \
    https://repo.or.cz/socat.git \
    https://github.com/Kitware/CMake.git \
    https://git.musl-libc.org/git/musl \
    https://github.com/openssl/openssl.git \
    https://github.com/sqlite/sqlite.git \
    https://github.com/curl/curl.git \
    https://github.com/git/git.git \
    https://github.com/htop-dev/htop.git \
    https://github.com/pciutils/pciutils.git \
    https://github.com/lyonel/lshw.git \
    https://github.com/gregkh/usbutils.git \
    https://git.busybox.net/busybox \
    https://github.com/hugsy/gef.git \
    https://github.com/hugsy/gef-extras.git \
    ;
do
    dir="$(echo "${url}" | cut -d/ -f3-)"
    [ -d "${dir}" ] || git clone --mirror "${url}" "${dir}"
    
done
