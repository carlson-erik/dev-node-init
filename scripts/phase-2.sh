#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <new-hostname>"
  echo "Example: $0 appname-dev-#"
  exit 1
fi

echo "***************************************"
echo "**              PHASE 2              **"
echo "***************************************"

echo "[Installing] nvm"
sh ./install/nvm.sh

echo "[Installing] neovim"
sh ./install/neovim.sh

echo "[Configuring] Changing hostname to $1"
sh ./configure/change-hostname.sh $1

echo "[Configuring] dotfiles"
sh ./configure/setup-dotfiles.sh
