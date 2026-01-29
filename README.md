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

Installing these applications depends on the OS and package manager. However, I tend to use [brew](https://brew.sh) to manage terminal packages.

### Terminal Emulator: `ghostty`

Install the latest version of the [ghostty emulator](https://ghostty.org/).

### Shell: `fish`

Install the latest version of the [fish shell](https://fishshell.com/). Afterwards, install [starship](https://starship.rs) to get a pretty prompt.

[fisher](https://github.com/jorgebucaran/fisher) is also included with a bunch of plugins I use.

### Version Control: `jj`

[Jujutsu](https://www.jj-vcs.dev/latest/) offers a more streamlined workflow while still being compatible with Git, and [jjui](https://github.com/idursun/jjui) offers a nice TUI to match. If `jj` is not usable for a repo (e.g., lacking force push permissions), [lazygit](https://github.com/jesseduffield/lazygit) offers a similar intuitive TUI.

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
- `yazi`
- `zoxide`

## Notes

### Visuals
  - My preferred [Nerd Font](https://www.nerdfonts.com/) is JetBrains Mono.
  - My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
  
### Docker & Kubernetes
  - On non-Linux hosts, I use [Rancher Desktop](https://rancherdesktop.io/).
  - On Linux hosts, I use [Docker Engine](https://docs.docker.com/engine/) together with [minikube](https://minikube.sigs.k8s.io/).
  - Regardless of host, I pair together [lazydocker](https://github.com/jesseduffield/lazydocker) and [k9s](https://github.com/derailed/k9s) to manage my containers.
  
### Python
  - I use [uv](https://github.com/astral-sh/uv) as my primary Python interface.

### AI Coding Agent
  - [Amp](http://ampcode.com/home) provides a best-in-class terminal agent experience, and its free tier is more than enough for my use cases.
