local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "catppuccin-macchiato"
config.font = wezterm.font('JetBrains Mono')
config.hide_tab_bar_if_only_one_tab = true

config.default_prog = { 'tmux' }

return config
