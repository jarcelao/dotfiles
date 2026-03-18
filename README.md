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

### Terminal Emulator: `wezterm`

Install the latest version of [wez's terminal emulator](https://wezterm.org/install/linux.html).

### Shell: `fish`

Install the latest version of the [fish shell](https://fishshell.com/). Afterwards, install [starship](https://starship.rs) to get a pretty prompt.

[fisher](https://github.com/jorgebucaran/fisher) is also included with a bunch of plugins I use.

### Terminal Multiplexer: `tmux`

Install the latest version of the [tmux multiplexer](https://github.com/tmux/tmux).

> [!NOTE]
> Install the following before launching `tmux`:
>   - [tpm](https://github.com/tmux-plugins/tpm)
>   - [catppuccin](https://github.com/catppuccin/tmux)
>
> Else the configuration will not load!

### Editor: `neovim`

Install the latest version of the [neovim editor](https://neovim.io/). 

This repo contains a custom neovim configuration based on [nvchad](https://github.com/NvChad/NvChad).

### AI Agent: `pi`

I use [pi](https://github.com/badlogic/pi-mono/) as my primary AI agent interface.

This repo contains a custom `pi` configuration.

### Git: `lazygit` + `difft`

Install both [lazygit](https://github.com/jesseduffield/lazygit) and [difftastic](https://difftastic.wilfred.me.uk/).

This repo includes a script that automatically sets `difftastic` as the diff viewer.

### Dev Environments: `mise`

Install [mise-en-place](https://mise.jdx.dev/) which manages dev environments for projects.

### Docker: Rancher Desktop / Docker Engine
  - On non-Linux hosts, I use [Rancher Desktop](https://rancherdesktop.io/).
  - On Linux hosts, I use [Docker Engine](https://docs.docker.com/engine/). 
  - Regardless of host, I use [lazydocker](https://github.com/jesseduffield/lazydocker) to manage my containers.

### Terminal Utilities

These are other utilities which are helpful for my daily tasks:

- `bat`
- `bottom`
- `dua-cli`
- `eza`
- `fd`
- `fzf`
- `jq`
- `ripgrep`
- `sevenzip`
- `yazi`
- `zoxide`

## Notes

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is JetBrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
