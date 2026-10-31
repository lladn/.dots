# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for macOS, managed with nix-darwin (`configuration.nix`) and Home Manager (`home.nix`), wired up in `flake.nix`.

## Apply Changes

```sh
./rebuild.sh   # nix-darwin switch for #mac
```

## Dotfile Links

`home/` mirrors `$HOME`. `home.nix` links each entry in its `home.file` list from `~/<path>` to `home/<path>` with `mkOutOfStoreSymlink`, so edits apply without a rebuild. Adding a new path needs a rebuild.

| Repo path | Linked to |
|-----------|-----------|
| `home/.config/{nvim,ghostty,mise,starship.toml}` | `~/.config/...` |
| `home/.tmux.conf` | `~/.tmux.conf` |
| `home/AGENTS.md` | `~/.claude/AGENTS.md` (all agent rules, includes coding guidelines) |
| `home/.claude/{settings.json,CLAUDE.md,commands}` | `~/.claude/...` (`CLAUDE.md` only imports `AGENTS.md`) |

Zsh is configured by `programs.zsh` in `home.nix`.

`tmux_init.sh` is a standalone bootstrap script — run it directly to create a preconfigured tmux session (not linked).

## Neovim Architecture

Config lives in `home/.config/nvim/lua/lowelad/`. Entry point is `init.lua` → `lazy_init.lua` → loads all plugins from `lua/lowelad/lazy/`.

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
