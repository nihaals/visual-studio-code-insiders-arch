#!/bin/bash
set -euo pipefail

# Enable the multilib repository
cat << EOF >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF

pacman -Syyu --noconfirm --needed base-devel

useradd builder -m
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
