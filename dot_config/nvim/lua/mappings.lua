local map = vim.keymap.set

-- ===== general mappings =====

-- insert
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "jk", "<ESC>")

-- window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- general
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- command
map("n", ";", ":", { desc = "CMD enter command mode" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- comment
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- tabufline
if require("nvconfig").ui.tabufline.enabled then
  map("n", "<tab>", function()
    require("nvchad.tabufline").next()
  end, { desc = "buffer goto next" })

  map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
  end, { desc = "buffer goto prev" })

  -- map("n", "<leader>x", function()
  --   require("nvchad.tabufline").close_buffer()
  -- end, { desc = "buffer close" })
end

-- ===== which-key mappings =====

require("which-key").add {
  { "<leader>b", group = "Buffer" },
  { "<leader>bn", "<cmd>enew<CR>", desc = "buffer new" },
  { "<leader>bd", "<cmd>bdelete<CR>", desc = "buffer delete" },
  { "<leader>b[", "<cmd>bprevious<CR>", desc = "buffer previous" },
  { "<leader>b]", "<cmd>bnext<CR>", desc = "buffer next" },

  { "<leader>d", group = "Diagnostics" },
  {
    "<leader>dl",
    function()
      vim.diagnostic.setloclist()
    end,
    desc = "diagnostics loclist",
  },
  {
    "<leader>dn",
    function()
      vim.diagnostic.goto_next()
    end,
    desc = "next diagnostic",
  },
  {
    "<leader>dp",
    function()
      vim.diagnostic.goto_prev()
    end,
    desc = "previous diagnostic",
  },
  {
    "<leader>df",
    function()
      vim.diagnostic.open_float()
    end,
    desc = "diagnostic float",
  },

  { "<leader>e", group = "Explorer" },
  { "<leader>et", "<cmd>NvimTreeToggle<CR>", desc = "explorer toggle" },
  { "<leader>ef", "<cmd>NvimTreeFocus<CR>", desc = "explorer focus" },

  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "find files" },
  { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "find all files" },
  { "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "live grep" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "find buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "help tags" },
  { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "find oldfiles" },
  { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "find in buffer" },

  { "<leader>g", group = "Git" },
  { "<leader>gl", "<cmd>LazyGit<CR>", desc = "lazygit" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "git status" },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "git commits" },

  { "<leader>c", group = "Code" },
  {
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "code action",
  },
  {
    "<leader>cr",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "rename",
  },
  {
    "<leader>cd",
    function()
      vim.lsp.buf.definition()
    end,
    desc = "go to definition",
  },
  {
    "<leader>ci",
    function()
      vim.lsp.buf.implementation()
    end,
    desc = "go to implementation",
  },
  {
    "<leader>ch",
    function()
      vim.lsp.buf.hover()
    end,
    desc = "hover",
  },
  {
    "<leader>cm",
    function()
      require("conform").format { lsp_fallback = true }
    end,
    desc = "format file",
  },
  { "<leader>cs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "document symbols" },
  { "<leader>c/", "gcc", desc = "toggle comment", remap = true },

  { "<leader>n", group = "NvChad" },
  { "<leader>nc", "<cmd>NvCheatsheet<CR>", desc = "nvchad cheatsheet" },
  {
    "<leader>nt",
    function()
      require("nvchad.themes").open()
    end,
    desc = "nvchad themes",
  },

  { "<leader>t", group = "Terminal" },
  {
    "<leader>th",
    function()
      require("nvchad.term").new { pos = "sp" }
    end,
    desc = "new horizontal term",
  },
  {
    "<leader>tv",
    function()
      require("nvchad.term").new { pos = "vsp" }
    end,
    desc = "new vertical term",
  },
  {
    "<leader>tH",
    function()
      require("nvchad.term").toggle { pos = "sp" }
    end,
    desc = "toggle horizontal term",
  },
  {
    "<leader>tV",
    function()
      require("nvchad.term").toggle { pos = "vsp" }
    end,
    desc = "toggle vertical term",
  },
  {
    "<leader>tf",
    function()
      require("nvchad.term").toggle { pos = "float" }
    end,
    desc = "toggle float term",
  },

  { "<leader>u", group = "UI" },
  { "<leader>un", "<cmd>set number!<CR>", desc = "toggle line numbers" },
  { "<leader>ur", "<cmd>set relativenumber!<CR>", desc = "toggle relative numbers" },
  { "<leader>uw", "<cmd>set wrap!<CR>", desc = "toggle wrap" },
  { "<leader>us", "<cmd>set spell!<CR>", desc = "toggle spell" },

  { "<leader>w", group = "Window" },
  { "<leader>wh", "<C-w>h", desc = "window left" },
  { "<leader>wl", "<C-w>l", desc = "window right" },
  { "<leader>wj", "<C-w>j", desc = "window down" },
  { "<leader>wk", "<C-w>k", desc = "window up" },

  { "<leader>h", group = "WhichKey" },
  { "<leader>hK", "<cmd>WhichKey <CR>", desc = "whichkey all keymaps" },
  {
    "<leader>hk",
    function()
      vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
    end,
    desc = "whichkey query lookup",
  },
}
