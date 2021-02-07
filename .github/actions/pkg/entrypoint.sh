#!/bin/bash
set -euo pipefail

chmod -R a+rw .

sudo -Eu builder makepkg --printsrcinfo > .SRCINFO

PKGFILE="$(sudo -Eu builder makepkg --packagelist)"
echo "Package: $PKGFILE"

# Build packages
sudo -EH -u builder makepkg --syncdeps --noconfirm

# makepkg reports absolute paths, must be relative for use by other actions
RELPKGFILE="$(realpath --relative-base="$PWD" "$PKGFILE")"
if [ -f "$PKGFILE" ]; then
  echo "::set-output name=pkgfile::$RELPKGFILE"
else
  echo "Archive $RELPKGFILE not built"
  exit 1
fi
