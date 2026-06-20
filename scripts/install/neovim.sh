#!/bin/sh

echo "[neovim] Fetching latest deb release"
curl -LO https://github.com/neovim/neovim-releases/releases/latest/download/nvim-linux-x86_64.deb

echo "[neovim] Installing latest deb release"
sudo apt install ./nvim-linux-x86_64.deb

echo "[neovim] Removing local deb file"
rm nvim-linux-x86_64.deb

