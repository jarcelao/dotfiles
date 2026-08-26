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

### Shell: `fish`

Install the [fish shell](https://fishshell.com/). Set it as the login shell with `chsh`.

On top of this, I use [starship](https://starship.rs) for a pretty prompt. Ensure that this is available before applying the dotfiles.

### Editor: `nvim`

Install the [neovim editor](https://neovim.io/).

This repo contains a neovim configuration built on [AstroNvim](https://docs.astronvim.com/).

### AI Agent: `codex` / `omp`

Install the [Codex](https://github.com/openai/codex) and [oh-my-pi](https://github.com/can1357/oh-my-pi) AI agents.

Codex is used as a daily driver with OpenAI models. OMP is for more experimental use cases.

### Agent Multiplexer: `herdr`

Install the [herdr agent multiplexer](https://herdr.dev/).

### Terminal Utilities

These are other utilities which are helpful for my daily tasks:

- `bat` (pretty `cat` alternative)
- `eza` (pretty `ls` alternative)
- `fd` (fast `find` alternative)
- `fzf` (fuzzy finder)
- `gh` (github cli)
- `jq` (JSON parser)
- `lazygit` (git tui)
- `mise` (dev env manager)
- `pnpm` (fast js package manager)
- `ripgrep` (fast `grep` alternative)
- `superfile` (file manager tui)
- `uv` (python package manager)
- `zoxide` (convenient `cd` alternative)

## Notes

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is JetBrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
