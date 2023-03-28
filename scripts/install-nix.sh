#!/usr/bin/env bash

os=$(uname)

if command -v nix >/dev/null 2>&1; then
    echo "Nix is already installed, skipping installation"
elif [ "$os" == "Linux" ]; then
    if grep -q Microsoft /proc/version; then
        echo "Linux on WSL detected"
        echo "Installing Nix without daemon"
        curl -L https://nixos.org/nix/install -o /tmp/install-nix.sh
        sh /tmp/install-nix.sh --no-daemon
    else
        echo "Linux detected"
        echo "Installing Nix with daemon"
        curl -L https://nixos.org/nix/install -o /tmp/install-nix.sh
        sh /tmp/install-nix.sh --daemon
    fi
elif [ "$os" == "Darwin" ]; then
    echo "MacOS detected"
    echo "Installing Nix"
    curl -L https://nixos.org/nix/install -o /tmp/install-nix.sh
    sh /tmp/install-nix.sh
elif [ "$os" == "Windows_NT" ]; then
    echo "Windows detected"
    echo "Skipping Nix installation"
else
    echo "Unknown operating system detected"
fi
