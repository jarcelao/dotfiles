require("nvchad.configs.lspconfig").defaults()

local servers = { "ty", "lua-language-server" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
