# AGENTS.md - Neovim Config

## Build/Test Commands
- **Lint**: `stylua --check lua/` (check formatting)
- **Format**: `stylua lua/` (apply formatting)
  - `stylua` is installed via Mason at: `~/.local/share/nvim/mason/bin/stylua`
  - Not available as system binary; use Mason-installed version
- **Test**: No tests (configuration repository)
- **Verify**: Load nvim and check `:checkhealth` output

## Architecture
- **Base**: NvChad v2.5 (plugin framework)
- **Plugin Manager**: lazy.nvim (in init.lua)
- **Structure**:
  - `init.lua` - Entry point, lazy.nvim bootstrap, plugin loader
  - `lua/chadrc.lua` - NvChad theme/UI config (catppuccin theme, transparency enabled)
  - `lua/configs/` - Plugin configurations (lazy, lspconfig, mason, conform, mason-tool-installer)
  - `lua/plugins/init.lua` - Plugin specifications (conform, lspconfig, lazygit, mason-tool-installer, which-key)
  - `lua/options.lua` - Editor options
  - `lua/mappings.lua` - Keybindings
  - `lua/autocmds.lua` - Autocommands
  - `.stylua.toml` - Lua formatter config (120 col, 2-space indent, Unix line endings)

## Code Style Guidelines
- **Language**: Lua (Neovim config language)
- **Formatter**: stylua (120 column width, 2-space indentation, Unix line endings)
- **Quote Style**: AutoPreferDouble (prefer double quotes)
- **Module Imports**: `require "module"` (no parens per stylua config)
- **Naming**: snake_case for variables/functions, UPPER_CASE for constants
- **Structure**: Module returns table pattern (`local M = {}; return M`)
- **Leader Key**: Space (`vim.g.mapleader = " "`)

## Upstream References
- **NvChad Repository**: https://github.com/NvChad/NvChad
  - Reference for plugin specification patterns, lazy.nvim configuration
  - Helpful for understanding NvChad conventions and best practices for downstream configs
