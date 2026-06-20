#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <new-hostname>"
  echo "Example: $0 appname-dev-#"
  exit 1
fi

echo "[Configuring] Changing hostname to $1"
sh ./configure/change-hostname.sh $1

echo "[Configuring] dotfiles"
sh ./configure/setup-dotfiles.sh
