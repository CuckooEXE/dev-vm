FROM alpine:3.19

ENV TZ=UTC
ENV PATH="/root/.local/bin:${PATH}"

# ---------- Base Packages ----------
RUN apk add --no-cache \
    bash \
    git \
    curl \
    wget \
    unzip \
    build-base \
    cmake \
    ninja \
    gettext \
    libtool \
    autoconf \
    automake \
    pkgconfig \
    ripgrep \
    fd \
    xclip \
    nodejs \
    npm \
    python3 \
    py3-pip \
    py3-virtualenv \
    go \
    cargo \
    rust \
    ruby \
    ruby-dev \
    openjdk17 \
    luarocks \
    neovim 

# ---------- Python Tooling via pipx ----------
RUN python3 -m venv /opt/pipx \
    && /opt/pipx/bin/pip install --upgrade pip \
    && /opt/pipx/bin/pip install pipx \
    && ln -s /opt/pipx/bin/pipx /usr/local/bin/pipx \
    && pipx ensurepath

RUN pipx install python-lsp-server \
    && pipx install black \
    && pipx install flake8 \
    && pipx install isort

# ---------- Node LSPs ----------
RUN npm install -g \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted \
    bash-language-server \
    pyright \
    yaml-language-server \
    dockerfile-language-server-nodejs \
    emmet-ls


# ---------- Create user ----------
# RUN adduser -D dev
# USER dev
# WORKDIR /home/dev

# ---------- Install NvChad ----------
RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# ---------- Install Plugins ----------
RUN nvim --headless "+Lazy! sync" +qa

# ---------- Install Treesitter Parsers ----------
RUN nvim --headless "+TSInstall all" +qa || true

CMD ["nvim"]