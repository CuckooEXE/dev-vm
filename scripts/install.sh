#!/bin/sh
#!/usr/bin/env bash
set -eux

# Update system
sudo apt update
sudo apt upgrade -y

# Base packages
sudo apt install -y \
  git \
  curl \
  wget \
  build-essential \
  ripgrep \
  fd-find \
  clang \
  python3 \
  python3-pip \
  unzip \
  ca-certificates

# Symlink fd (Debian names it fdfind)
sudo ln -s /usr/bin/fdfind /usr/local/bin/fd || true

# -----------------------------
# Install Neovim (latest)
# -----------------------------
NVIM_VERSION="v0.9.5"
curl -LO https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# -----------------------------
# Install Zig
# -----------------------------
ZIG_VERSION="0.11.0"
curl -LO https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz
tar -xf zig-linux-x86_64-${ZIG_VERSION}.tar.xz
sudo mv zig-linux-x86_64-${ZIG_VERSION} /opt/zig
sudo ln -s /opt/zig/zig /usr/local/bin/zig

# -----------------------------
# Install NvChad
# -----------------------------
mkdir -p /home/packer/.config
git clone https://github.com/NvChad/NvChad /home/packer/.config/nvim

chown -R packer:packer /home/packer/.config

# Preinstall plugins
sudo -u packer nvim --headless "+Lazy sync" +qa

# Preinstall treesitter parsers
sudo -u packer nvim --headless "+TSInstallSync all" +qa

echo "Provisioning complete"
