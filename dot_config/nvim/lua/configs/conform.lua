local options = {
  formatters_by_ft = {
    json = { "jq" },
    lua = { "stylua" },
    yaml = { "yq" },
    python = { "ruff_fix" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
