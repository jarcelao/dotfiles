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

### Terminal Emulator: `ghostty`

Install the [Ghostty terminal](https://ghostty.org).

### Shell: `bash`

`bash` should likely be available by default.

In this config, `~/.bashrc` contains general configurations, while `~/.bashrc.d/` contains machine-specific ones.

On top of `bash`, I use [flyline](https://github.com/HalFrgrd/flyline) for a fish-like experience and [starship](https://starship.rs) for a pretty prompt. Ensure that these tools are available before applying the dotfiles.

### Editor: `nvim`

Install the [neovim editor](https://neovim.io/).

This repo contains a neovim configuration built on [AstroNvim](https://docs.astronvim.com/).

### AI Agent: `opencode`

Install the [OpenCode AI agent](https://opencode.ai/docs/).

### Agent Multiplexer: `herdr`

Install the [herdr agent multiplexer](https://herdr.dev/).

### Containers: Rancher Desktop / Docker Engine
  - On non-Linux hosts, I use [Rancher Desktop](https://rancherdesktop.io/).
  - On Linux hosts, I use [Docker Engine](https://docs.docker.com/engine/).

### Terminal Utilities

These are other utilities which are helpful for my daily tasks:

- `fd` (fast `find` alternative)
- `fzf` (fuzzy finder)
- `jq` (JSON parser)
- `hunk` (pretty diff viewer)
- `lazygit` (git tui)
- `mise` (dev env manager)
- `pnpm` (fast js package manager)
- `ripgrep` (fast `grep` alternative)
- `uv` (python package manager)
- `yazi` (file manager tui)
- `zoxide` (fast `cd` alternative)

## Notes

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is JetBrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
