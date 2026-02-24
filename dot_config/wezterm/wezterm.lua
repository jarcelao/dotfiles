local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "catppuccin-macchiato"
config.font = wezterm.font('JetBrains Mono')
config.hide_tab_bar_if_only_one_tab = true

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.default_prog = { 'tmux' }
elseif wezterm.target_triple == 'aarch64-apple-darwin' then
  config.default_prog = { '/opt/homebrew/bin/tmux' }
end

return config
