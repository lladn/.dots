#!/usr/bin/env bash
set -euo pipefail
sudo nix run nix-darwin -- switch --flake ~/lladn/.dots#mac

