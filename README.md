# echo's dotfiles

This repo contains dotfiles for the applications I use.

## Prerequisites

This repo makes use of [chezmoi](https://chezmoi.io) as a dotfile manager. Refer to the [installation guide](https://www.chezmoi.io/install/) to set up this application.

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

Install the latest version of the [`fish` shell](https://fishshell.com/). Afterwards, install [starship](https://starship.rs) to get a pretty prompt. The dotfiles should handle configuration for these.

### Editor: `nvim`

Install the latest version of `nvim`. The dotfiles should automatically load [LazyVim](https://lazyvim.github.io/) plus any user configurations.

Ensure you have the following LazyVim dependencies as stated in the Getting Started page:

- Neovim >= 0.11.2 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- a Nerd Font (v3.0 or greater) (optional, but needed to display some icons)
- `lazygit` (optional)
- `tree-sitter-cli` and a C compiler for `nvim-treesitter`. See here
- `curl` for `blink.cmp` (completion engine)
- for `fzf-lua` (optional)
  - `fzf`: `fzf` (v0.25.1 or greater)
  - live grep: `ripgrep`
  - find files: `fd`
- a terminal that support true color and undercurl:
  - kitty (Linux & Macos)
  - wezterm (Linux, Macos & Windows)
  - alacritty (Linux, Macos & Windows)
  - iterm2 (Macos)
  - ghostty (Linux, Macos & Windows)

### Containers

Install [Rancher Desktop](https://rancherdesktop.io/), which should enable the use of `docker` along with K8S via [`k3s`](https://k3s.io/).

For container management, I use the following:

- [`lazydocker`](https://github.com/jesseduffield/lazydocker)
- [`k9s`](https://k9scli.io/)

### Languages

The primary languages I use are Python and Javascript. Thus, I use the following tools:

- [`uv`](https://docs.astral.sh/uv/)
- [`bun`](https://bun.sh)
  - `node` is also okay

I prefer per-language tooling over generic environment managers (e.g., `asdf`, `mise`).

### AI CLI: `opencode`

Install the latest version of [`opencode`](https://opencode.ai/) with the following command, assuming `bun` is installed:

```bash
bun add -g opencode-ai
```

Then, perform `opencode auth login` and configure the OpenRouter provider.

### Other Utilities

These are other applications which are helpful for my daily tasks:

- `bashtop`
- `fd`
- `fzf`
- `gh`
- `lazygit`
- `ripgrep`

## Notes

- My preferred [Nerd Font](https://www.nerdfonts.com/) is Jetbrains Mono.
- My preferred color scheme is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).
