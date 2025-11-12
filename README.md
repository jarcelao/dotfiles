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
chezmoi init --apply https://github.com/$GITHUB_USERNAME/dotfiles.git
```

For more details, see the [quick start guide](https://www.chezmoi.io/quick-start/)

## Applications

Installing the following applications depends on the OS and package manager you are using.

### Terminal Emulator: `ghostty`

Install the latest version of [`ghostty`](https://ghostty.org/). The dotfiles should configure `ghostty`, assuming all prerequisites such as fonts are installed.

For Windows, the [Windows Terminal](https://github.com/microsoft/terminal) should do. However, configuration can only be done manually.

### Shell: `fish`

Install the latest version of the [`fish` shell](https://fishshell.com/).

Also install [fisher](https://github.com/jorgebucaran/fisher) as the dotfiles includes some fish plugins.

Afterwards, install [starship](https://starship.rs) to get a pretty prompt.

### Editor: `nvim`

Install the latest version of `nvim`. The dotfiles should automatically load [LazyVim](https://lazyvim.github.io/) plus any user configurations.

Ensure you have installed LazyVim's dependencies as stated in the link above.

### Containers

Install [Rancher Desktop](https://rancherdesktop.io/), which should enable the use of `docker` along with K8S via [`k3s`](https://k3s.io/).

For container management, I use the following:

- [`lazydocker`](https://github.com/jesseduffield/lazydocker)
- [`k9s`](https://k9scli.io/)

### Other Utilities

These are other applications which are helpful for my daily tasks:

- `bat`
- `btop`
- `eza`
- `fastfetch`
- `fd`
- `fzf`
- `gh`
- `jq`
- `lazygit`
- `ripgrep`
- `yazi`
- `zoxide`

## Notes

- My preferred [Nerd Font](https://www.nerdfonts.com/) is Jetbrains Mono.
- My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
