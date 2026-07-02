# dotfiles

macOS dev environment, built on [betaflag/philosophy](https://github.com/betaflag/philosophy)
(see the [config area](https://github.com/betaflag/philosophy/blob/main/areas/config.md)).

## Setup

    ./bootstrap

Installs tools from `Brewfile` and symlinks configs into `$HOME` with GNU stow.
Idempotent. Remove a package's symlinks with `stow -D <name>`.

Git identity is per-machine and untracked: set name, email, and signing key in
`~/.gitconfig.local` (see `gitconfig.local.example`).

## What's included

Each top-level directory is a stow package symlinked into `$HOME`:

| Package    | Configures                                                             |
| ---------- | --------------------------------------------------------------------- |
| `zsh`      | `.zshrc`, `.zprofile`, `.zshenv` — lean shell, no framework           |
| `starship` | Single-line prompt (path · git · char)                                |
| `ghostty`  | Terminal — font, tabs, macOS vibrancy                                  |
| `git`      | `.gitconfig` — aliases, SSH commit signing (identity in `.local`)     |
| `zed`      | Editor settings and keymap                                            |
| `nvim`     | Hand-rolled Neovim (lazy.nvim, no distro) — treesitter, telescope, git |
| `claude`   | `~/.claude/CLAUDE.md` — global Claude Code development standards        |

## Appearance

ghostty, zed, and nvim follow the macOS light/dark setting automatically:

- Light → Rosé Pine Dawn
- Dark → Tokyo Night

zed's Tokyo Night needs its Themes extension installed (Extensions panel); the
built-in Rosé Pine Dawn works out of the box.

## Managing packages

Add a package: create a `<name>/` directory mirroring the `$HOME` layout (e.g.
`<name>/.config/<name>/config`), add `<name>` to the `stow` line in `bootstrap`,
then `stow --target="$HOME" --restow <name>`.

Remove a package's symlinks: `stow -D <name>`.
