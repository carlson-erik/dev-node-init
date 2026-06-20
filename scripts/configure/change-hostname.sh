#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <new-hostname>"
  echo "Example: $0 appname-dev-#"
  exit 1
fi

NEW_HOSTNAME="$1"
OLD_HOSTNAME="$(hostname)"

sudo hostnamectl set-hostname "$NEW_HOSTNAME"
sudo sed -i "s/$OLD_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts

echo "Hostname updated: $OLD_HOSTNAME → $NEW_HOSTNAME"
echo "Start a new shell session for the change to reflect in your prompt."
