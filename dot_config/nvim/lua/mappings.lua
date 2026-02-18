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

  map("n", "<leader>bd", function()
    require("nvchad.tabufline").close_buffer()
  end, { desc = "buffer close" })
end

-- ===== which-key mappings =====

require("which-key").add {
  { "<leader>b", group = "Buffer" },
  { "<leader>bn", "<cmd>enew<CR>", desc = "buffer new" },
  { "<leader>b[", "<cmd>bprevious<CR>", desc = "buffer previous" },
  { "<leader>b]", "<cmd>bnext<CR>", desc = "buffer next" },
  { "<leader>bd", "<cmd>bdelete<CR>", desc = "buffer delete" },
  { "<leader>bD", "<cmd>bdelete!<CR>", desc = "buffer force delete" },
  { "<leader>bo", "<cmd>%bdelete|e#|bd#<CR>", desc = "buffer close others" },
  {
    "<leader>bp",
    function()
      require("nvchad.tabufline").pin_buf()
    end,
    desc = "buffer pin/unpin",
  },
  {
    "<leader>bP",
    function()
      require("nvchad.tabufline").close_unpinned_bufs()
    end,
    desc = "buffer close unpinned",
  },
  {
    "<leader>bL",
    function()
      require("nvchad.tabufline").closeBufs_at_direction "left"
    end,
    desc = "buffer close left",
  },
  {
    "<leader>bR",
    function()
      require("nvchad.tabufline").closeBufs_at_direction "right"
    end,
    desc = "buffer close right",
  },
  {
    "<leader>bs",
    function()
      require("nvchad.tabufline").move_buf(1)
    end,
    desc = "buffer move right",
  },
  {
    "<leader>bS",
    function()
      require("nvchad.tabufline").move_buf(-1)
    end,
    desc = "buffer move left",
  },
  { "<leader>bf", "<cmd>buffer #<CR>", desc = "buffer alternate" },
  { "<leader>bF", "<cmd>Telescope buffers<CR>", desc = "buffer find" },

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
    "<leader>cf",
    function()
      require("conform").format { lsp_fallback = true }
    end,
    desc = "format file",
  },
  {
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    desc = "Symbols (Trouble)",
  },
  {
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  {
    "<leader>cc",
    function()
      vim.lsp.buf.incoming_calls()
    end,
    desc = "incoming calls",
  },
  {
    "<leader>ct",
    function()
      vim.lsp.buf.type_definition()
    end,
    desc = "type definition",
  },
  {
    "<leader>cR",
    function()
      vim.lsp.buf.references()
    end,
    desc = "references",
  },
  {
    "<leader>cD",
    function()
      vim.lsp.buf.declaration()
    end,
    desc = "declaration",
  },
  {
    "<leader>cg",
    function()
      vim.lsp.buf.signature_help()
    end,
    desc = "signature help",
  },
  { "<leader>c/", "gcc", desc = "toggle comment", remap = true },

  { "<leader>e", group = "Explorer" },
  { "<leader>et", "<cmd>NvimTreeToggle<CR>", desc = "explorer toggle" },
  { "<leader>ef", "<cmd>NvimTreeFocus<CR>", desc = "explorer focus" },

  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "find files" },
  { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "find all files" },
  { "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "live grep" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "help tags" },
  { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "find oldfiles" },
  { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "find in buffer" },
  { "<leader>fs", "<cmd>Telescope persisted<CR>", desc = "find sessions" },
  { "<leader>fz", "<cmd>Telescope zoxide list<CR>", desc = "find zoxide" },

  { "<leader>g", group = "Git" },
  { "<leader>gl", group = "LazyGit" },
  { "<leader>gll", "<cmd>LazyGit<CR>", desc = "lazygit" },
  { "<leader>glc", "<cmd>LazyGitConfig<CR>", desc = "lazygit config" },
  { "<leader>glf", "<cmd>LazyGitCurrentFile<CR>", desc = "lazygit current file" },
  { "<leader>glF", "<cmd>LazyGitFilter<CR>", desc = "lazygit filter" },
  { "<leader>glC", "<cmd>LazyGitFilterCurrentFile<CR>", desc = "lazygit filter current file" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "git status" },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "git commits" },
  { "<leader>gg", "<cmd>Git<CR>", desc = "fugitive git command" },
  { "<leader>gG", "<cmd>G<CR>", desc = "fugitive status" },
  { "<leader>ge", "<cmd>Gedit<CR>", desc = "fugitive edit" },
  { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "fugitive diff split" },
  { "<leader>gv", "<cmd>Gvdiffsplit<CR>", desc = "fugitive vertical diff" },
  { "<leader>gr", "<cmd>Gread<CR>", desc = "fugitive read" },
  { "<leader>gw", "<cmd>Gwrite<CR>", desc = "fugitive write" },
  { "<leader>gm", "<cmd>GMove<CR>", desc = "fugitive move" },
  { "<leader>gD", "<cmd>GDelete<CR>", desc = "fugitive delete" },
  { "<leader>gB", "<cmd>Gbrowse<CR>", desc = "fugitive browse" },

  { "<leader>h", group = "WhichKey" },
  { "<leader>hK", "<cmd>WhichKey <CR>", desc = "whichkey all keymaps" },
  {
    "<leader>hk",
    function()
      vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
    end,
    desc = "whichkey query lookup",
  },

  { "<leader>n", group = "NvChad" },
  { "<leader>nc", "<cmd>NvCheatsheet<CR>", desc = "nvchad cheatsheet" },
  {
    "<leader>nt",
    function()
      require("nvchad.themes").open()
    end,
    desc = "nvchad themes",
  },

  { "<leader>s", group = "Shell" },
  {
    "<leader>sh",
    function()
      require("nvchad.term").new { pos = "sp" }
    end,
    desc = "new horizontal term",
  },
  {
    "<leader>sv",
    function()
      require("nvchad.term").new { pos = "vsp" }
    end,
    desc = "new vertical term",
  },
  {
    "<leader>sH",
    function()
      require("nvchad.term").toggle { pos = "sp" }
    end,
    desc = "toggle horizontal term",
  },
  {
    "<leader>sV",
    function()
      require("nvchad.term").toggle { pos = "vsp" }
    end,
    desc = "toggle vertical term",
  },
  {
    "<leader>sf",
    function()
      require("nvchad.term").toggle { pos = "float" }
    end,
    desc = "toggle float term",
  },

  { "<leader>t", group = "Tabs" },
  { "<leader>tn", "<cmd>tabnew<CR>", desc = "new tab" },
  { "<leader>tc", "<cmd>tabclose<CR>", desc = "close tab" },
  { "<leader>t[", "<cmd>tabprevious<CR>", desc = "previous tab" },
  { "<leader>t]", "<cmd>tabnext<CR>", desc = "next tab" },

  { "<leader>u", group = "UI" },
  { "<leader>un", "<cmd>set number!<CR>", desc = "toggle line numbers" },
  { "<leader>ur", "<cmd>set relativenumber!<CR>", desc = "toggle relative numbers" },
  { "<leader>uw", "<cmd>set wrap!<CR>", desc = "toggle wrap" },
  { "<leader>us", "<cmd>set spell!<CR>", desc = "toggle spell" },

  { "<leader>x", group = "Trouble" },
  {
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Buffer Diagnostics (Trouble)",
  },
  {
    "<leader>xL",
    "<cmd>Trouble loclist toggle<cr>",
    desc = "Location List (Trouble)",
  },
  {
    "<leader>xQ",
    "<cmd>Trouble qflist toggle<cr>",
    desc = "Quickfix List (Trouble)",
  },
}
