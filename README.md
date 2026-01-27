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

Installing these applications depends on the OS and package manager. However, I tend to use [brew](https://brew.sh) to manage terminal packages.

### Shell: `fish`

Install the latest version of the [fish shell](https://fishshell.com/). Afterwards, install [starship](https://starship.rs) to get a pretty prompt.

[fisher](https://github.com/jorgebucaran/fisher) is also included with a bunch of plugins I use.

### Editor: `vim`

Most likely, `vim` will already be available on whatever machine these dotfiles are installed on. This is meant to complement `zed` in use cases where lightweight text editing is sufficient.

### Version Control: `jj`

[Jujutsu](https://www.jj-vcs.dev/latest/) offers a more streamlined workflow while still being compatible with Git.

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
- `lazygit`
- `lazydocker`
- `k9s`
- `ripgrep`
- `yazi`
- `zoxide`

## Notes

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is JetBrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
  
### Docker & Kubernetes
  - On non-Linux hosts, I use [Rancher Desktop](https://rancherdesktop.io/).
  - On Linux hosts, I use [Docker Engine](https://docs.docker.com/engine/) together with [minikube](https://minikube.sigs.k8s.io/). 
  
### Python
  - I use [uv](https://github.com/astral-sh/uv) as my primary Python interface.

### JavaScript
  - Whenever possible, I use [bun](https://bun.sh) as my JavaScript runtime.
  - Otherwise, I use the latest available Node LTS release.

### AI Coding Agent
  - [Amp](http://ampcode.com/home) provides a best-in-class terminal agent experience, and its free tier is more than enough for my use cases.
