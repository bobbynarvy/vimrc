#!/bin/bash

# Install dependencies; run as root

apt update
apt install curl

# install vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install Telescope dependencies
apt install -y fd-find ripgrep

# install LSP dependencies
apt install -y clangd-15
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-15 100 
