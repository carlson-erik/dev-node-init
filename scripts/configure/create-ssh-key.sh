#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <key-comment>"
  echo "Example: $0 appname-dev-#"
  exit 1
fi

COMMENT="$1"
KEY_PATH="$HOME/.ssh/id_ed25519"

# Warn if a key already exists
if [ -f "$KEY_PATH" ]; then
  read -r -p "An SSH key already exists at $KEY_PATH. Overwrite? [y/N] " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi
fi

echo "Generating SSH key with comment: $COMMENT"
ssh-keygen -t ed25519 -C "$COMMENT" -f "$KEY_PATH"

# Ensure ssh-agent is running and add the key
eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

echo ""
echo "========================================"
echo "Your public key (add this to GitHub):"
echo "========================================"
cat "${KEY_PATH}.pub"
echo "========================================"
cat "$KEY_PATH"
