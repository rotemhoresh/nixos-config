#!/usr/bin/env bash

# ---------------
# NixOS switcher and commiter
#
# Inspiration:
# https://gist.githubusercontent.com/0atman/1a5133b842f929ba4c1e195ee67599d5/raw/4e2f3ad34edb07843db9d6abb7c340bba611c07e/nixos-rebuild.sh
# Referenced from:
# https://www.youtube.com/watch?v=CwfKlX3rA6E
# ---------------

set -e

# cd to your config dir
pushd ~/nixos-config/

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null \
  || ( alejandra . ; echo "formatting failed!" && exit 1)

# Shows your changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -am "$current"

# Back to where you were
popd
