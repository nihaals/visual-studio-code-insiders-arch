#!/bin/bash
set -euo pipefail

echo "Setting permissions..."
chmod -R a+rw .

echo "Writing SRCINFO..."
sudo -Eu builder makepkg --printsrcinfo > .SRCINFO

echo "Getting package file..."
PKGFILE="$(sudo -Eu builder makepkg --packagelist)"
echo "Package file: $PKGFILE"

# Build packages
echo "Building package..."
sudo -EH -u builder makepkg --syncdeps --noconfirm

# makepkg reports absolute paths, must be relative for use by other actions
RELPKGFILE="$(realpath --relative-base="$PWD" "$PKGFILE")"
if [ -f "$PKGFILE" ]; then
  echo "pkgfile=$RELPKGFILE" >> "$GITHUB_OUTPUT"
else
  echo "Archive $RELPKGFILE not built"
  exit 1
fi
