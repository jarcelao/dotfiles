# echo's dotfiles

This repo contains dotfiles for the applications I use.

## Prerequisites

This repo makes use of [chezmoi](https://chezmoi.io) as a dotfile manager. Refer to the [installation guide](https://www.chezmoi.io/install/) to set up this application.

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

## Setup

Run the following command:

```bash
chezmoi init --apply https://github.com/jarcelao/dotfiles.git
```

For more details, see the [quick start guide](https://www.chezmoi.io/quick-start/)

## GUI Applications

### Terminal Emulator: `ghostty`

Install the latest version of the [`ghostty` emulator](https://ghostty.org/).

### Editor: `zed`

Install the latest version of [`zed`](https://zed.dev/).

## CLI/TUI Applications

Installing these applications depends on the OS and package manager. However, as a general guidance, I prefer using [`brew`](https://brew.sh) to manage terminal packages.

### Shell: `fish`

Install the latest version of the [`fish` shell](https://fishshell.com/). Afterwards, install [starship](https://starship.rs) to get a pretty prompt.

### Terminal Utilities

These are other utilities which are helpful for my daily tasks:

- `bat`
- `dua-cli`
- `eza`
- `fd`
- `fzf`
- `jq`
- `jj`
- `ripgrep`
- `yazi`
- `zoxide`

## Notes

For terminal emulators:
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is Jetbrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
