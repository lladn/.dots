# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a Stow package that mirrors the target directory structure relative to `$HOME`.

## Stow Commands

```sh
# Symlink a package into $HOME
stow -vt ~ <package>        # e.g. stow -vt ~ nvim

# Remove a package's symlinks
stow -Dt ~ <package>

# Remove all symlinks
stow -D .
```

## Packages

| Directory | Target | Contents |
|-----------|--------|----------|
| `nvim/`   | `~/.config/nvim/` | Neovim config (lazy.nvim) |
| `ghostty/` | `~/.config/ghostty/` | Ghostty terminal config |
| `tmux/`   | `~/` | `.tmux.conf` |
| `.zshrc`  | `~/` | Zsh shell config (Oh My Zsh + spaceship theme) |

`tmux_init.sh` is a standalone bootstrap script — run it directly to create a preconfigured tmux session (not a Stow package).

## Neovim Architecture

Config lives in `nvim/.config/nvim/lua/lowelad/`. Entry point is `init.lua` → `lazy_init.lua` → loads all plugins from `lua/lowelad/lazy/`.

- **`lazy_init.lua`** — bootstraps lazy.nvim and points it at the `lowelad.lazy` spec directory
- **`remap.lua`** — all keymaps via which-key; leader is `<Space>`
- **`set.lua`** — vim options
- **`lazy/`** — one file per plugin (lsp, telescope, treesitter, conform, etc.)

Key bindings defined in `remap.lua`:
- `<leader>ff/fg/fl` — Telescope find files / git files / live grep
- `<leader>la/lr/ln` — LSP code action / references / rename
- `gd` / `K` — LSP go-to-definition / hover
- `<leader>t` — Open today's note (today.lua plugin)
- Format on save is wired via `BufWritePre` in `remap.lua`

Plugin versions are pinned in `lazy-lock.json` — commit this file when updating plugins.
