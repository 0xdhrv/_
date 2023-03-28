#!/usr/bin/env bash

nixConfigDir="$HOME/.config/nix"
nixConfig="$dir/nix.conf"

mkdir -p "$nixConfigDir"
cat << EOF > "$nixConfig"
experimental-features = nix-command flakes
EOF
