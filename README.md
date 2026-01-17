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

Install the latest version of the [ghostty emulator](https://ghostty.org/).

### Editor: `zed`

Install the latest version of the [zed editor](https://zed.dev/).

## CLI/TUI Applications

Installing these applications depends on the OS and package manager. However, as a general guidance, I prefer using [brew](https://brew.sh) to manage terminal packages.

### Shell: `fish`

Install the latest version of the [fish shell](https://fishshell.com/). Afterwards, install [starship](https://starship.rs) to get a pretty prompt.

### Editor: `vim`

Most likely, `vim` will already be available on whatever machine these dotfiles are installed on. This is meant to complement `zed` in use cases where lightweight text editing is sufficient.

### Terminal Utilities

These are other utilities which are helpful for my daily tasks:

- `bat`
- `bottom`
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

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is Jetbrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
  
### Docker & Kubernetes
  - Use [Rancher Desktop](https://rancherdesktop.io/) whenever it's available. It already includes all the essentials to run Docker and a single-node Kubernetes cluster.

### Programming Languages
  - I mostly code in Python and JavaScript, so these two programs provide the best tooling to manage them:
    - [uv](https://github.com/astral-sh/uv) for Python
    - [bun](https://bun.sh/) for JavaScript
  - If a terminal utility can be installed via the above (e.g., `uv tool install prek`), prefer using those. Otherwise, continue using `brew`.

### AI Coding Agent
  - [Amp](http://ampcode.com/home) provides a best-in-class terminal agent experience, and its free tier is more than enough for my use cases.
