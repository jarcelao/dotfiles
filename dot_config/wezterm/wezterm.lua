local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "catppuccin-macchiato"
config.font = wezterm.font('JetBrains Mono')

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.default_prog = { 'fish' }
end

return config
