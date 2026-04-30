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

## Applications

Installing these applications depends on the OS and package manager.

### Terminal Emulator: `warp`

Install the [Warp terminal](https://warp.dev).

### Shell: `bash`

`bash` should likely be available by default.

In this config, `~/.bashrc` contains general configurations, while `~/.bashrc.d/` contains machine-specific ones.

### Editor: `fresh`

Install the [fresh editor](https://getfresh.dev/).

### AI Agent: `pi`

Install the [pi AI agent](https://github.com/badlogic/pi-mono/). This assumes `npm` is installed.

### Docker: Rancher Desktop / Docker Engine + Lazydocker
  - On non-Linux hosts, I use [Rancher Desktop](https://rancherdesktop.io/).
  - On Linux hosts, I use [Docker Engine](https://docs.docker.com/engine/). 
  - Regardless of host, I use [lazydocker](https://github.com/jesseduffield/lazydocker) to manage my containers.

### Terminal Utilities

These are other utilities which are helpful for my daily tasks:

- `bat` (pretty `cat` alternative)
- `bottom` (task manager tui)
- `dua-cli` (disk space manager tui)
- `eza` (pretty `ls` alternative)
- `fd` (fast `find` alternative)
- `fzf` (fuzzy finder)
- `jq` (JSON parser)
- `lazygit` (git tui)
- `mise` (dev env manager)
- `npm` (js package manager)
- `ripgrep` (fast `grep` alternative)
- `sevenzip` (for compressed files)
- `tmux` (terminal multiplexer)
- `uv` (python package manager)
- `yazi` (file explorer tui)
- `zoxide` (fast `cd` alternative)

## Notes

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is JetBrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
