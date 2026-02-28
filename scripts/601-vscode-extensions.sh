#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

require_cmds code

for ext in \
    ms-python.python \
    ms-vscode.cpptools \
    xaver.clang-format	\
    ms-python.vscode-pylance \
    ms-python.debugpy \
    ms-toolsai.jupyter \
    ziglang.vscode-zig \
    rust-lang.rust-analyzer \
    ms-vscode.cpptools \
    esbenp.prettier-vscode \
    ms-vscode.cmake-tools \
    ms-vscode.cpptools-themes \
    redhat.java	\
    ms-vscode.cpptools-extension-pack \
    ms-azuretools.vscode-docker	\
    twxs.cmake \
    ms-dotnettools.csharp \
    ms-vscode-remote.remote-wsl	\
    ms-vscode-remote.remote-containers \
    ms-vscode-remote.remote-ssh	\
    ms-vscode-remote.remote-ssh-edit \
    redhat.vscode-yaml \
    ms-vscode.remote-explorer \
    njpwerner.autodocstring	\
    donjayamanne.python-extension-pack \
    yzhang.markdown-all-in-one \
    cschlosser.doxdocgen \
    DavidAnson.vscode-markdownlint \
    vadimcn.vscode-lldb \
    ms-vscode.makefile-tools \
    ms-vscode-remote.vscode-remote-extensionpack \
    ms-vscode.remote-server	\
    ms-vscode.hexeditor \
    ms-python.black-formatter \
    ;
do
    code --install-extension "${ext}"
done
