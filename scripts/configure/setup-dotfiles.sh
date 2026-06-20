#!/bin/sh

echo "[dotfiles] Cloning repository"
git clone https://github.com/carlson-erik/dotfiles dotfiles
mv dotfiles "$HOME"

echo "[dotfiles] Configuring neovim"
mkdir -p "$HOME/.config/nvim"
cp -avr "$HOME/dotfiles/config/nvim" "$HOME/.config/"

# Install Dependencies for *my* neovim configuration
echo "[dotfiles] Installing dependencies for neovim"
sudo apt install unzip python3-pip tree-sitter-cli
