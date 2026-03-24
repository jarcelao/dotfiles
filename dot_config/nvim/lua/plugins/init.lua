return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = {
      "MasonToolsInstall",
      "MasonToolsInstallSync",
      "MasonToolsUpdate",
      "MasonToolsUpdateSync",
      "MasonToolsClean",
    },
    opts = {
      ensure_installed = require "configs.mason-tool-installer",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = require "configs.nvim-treesitter",
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },

  {
    "folke/which-key.nvim",
    lazy = false,
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {
        delay = 0,
      }
    end,
  },

  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {},
  },

  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  {
    "milanglacier/minuet-ai.nvim",
    event = "VeryLazy",
    opts = require "configs.minuet",
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
