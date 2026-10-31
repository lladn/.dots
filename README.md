# Dotfiles

This repository contains all of the seutp scripts that I can use to configure a new computer or workspace. The programs that
are being setup include the following.

# Bootstrap 
## Managing Your Dotfiles with Git and Nix Home Manager

`home/` mirrors `$HOME`. Home Manager (`home.nix`) symlinks each tracked path
into place with `mkOutOfStoreSymlink`, so edits in the repo apply right away.

## setup
```sh
./rebuild.sh
```

## Add a new dotfile
Put it under `home/` at the same path it has under `$HOME`, add that path to
`home.file` in `home.nix`, then run `./rebuild.sh`.

## NOTE
- The `tmux` are already obsolete and will not update anymore, use `herdr`
