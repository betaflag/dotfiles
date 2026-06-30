# dotfiles

macOS dev environment, built on [betaflag/philosophy](https://github.com/betaflag/philosophy)
(see the [config area](https://github.com/betaflag/philosophy/blob/main/areas/config.md)).

## Setup

    ./bootstrap

Installs tools from `Brewfile` and symlinks configs into `$HOME` with GNU stow.
Idempotent. Remove a package's symlinks with `stow -D <name>`.

Git identity is per-machine and untracked: set name, email, and signing key in
`~/.gitconfig.local` (see `gitconfig.local.example`).
