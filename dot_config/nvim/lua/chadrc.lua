-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.term = {
  sizes = {
    sp = 0.5,
    vsp = 0.5,
    ["bo sp"] = 0.5,
    ["bo vsp"] = 0.5,
  },
  float = {
    row = 0.05,
    col = 0.05,
    width = 0.9,
    height = 0.9,
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
