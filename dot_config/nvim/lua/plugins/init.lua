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
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gedit",
      "Gsplit",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "GMove",
      "GDelete",
      "Gbrowse",
    },
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
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = require "configs.nvim-treesitter",
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

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
