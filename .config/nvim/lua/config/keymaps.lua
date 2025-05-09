-- leader
vim.g.mapleader = " "

-- exit file
vim.keymap.set("n", "<leader>q", ":q<CR>", {})

-- close current buffer/tab
vim.keymap.set("n", "<leader>bq", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer/tab" })

-- close all buffers/tab
vim.keymap.set("n", "<leader>baq", ":w | %bd | e# | bd#<CR>", { desc = "Close all buffers/tab" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil.nvim buffer." })

-- split window
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Split vertically the window" })
vim.keymap.set("n", "<leader>s", ":split<CR>", { desc = "Split horizontal the window" })

-- Navigate vim panes better
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>", { desc = "Move to top pane" })
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>", { desc = "Move to bottom pane" })
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", { desc = "Move to left pane" })
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", { desc = "Move to right pane" })

-- Change between buffers
vim.keymap.set("n", "<c-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Change to next buffer" })
vim.keymap.set("n", "<c-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Change to previous buffer." })

-- move line up and down in normal mode
vim.keymap.set("n", "<S-k>", "ddkP", { noremap = true, silent = true, desc = "Move line up in normal mode." })
vim.keymap.set("n", "<S-j>", "ddp", { noremap = true, silent = true, desc = "Move line down in normal mode." })

-- copy outside editor
vim.keymap.set("v", "<S-y>", '"+y', { noremap = true, silent = true, desc = "Copy line to system clipboard." })

-- open floating terminal inside neovim.
vim.keymap.set({ "n", "t" }, "<leader>e", function()
  require("config.float_term").float_term("nu", { cwd = vim.fn.expand("%:p:h") })
end, { desc = "Toggle floating terminal" })

-- open neogit
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { noremap = true, silent = true, desc = "Open neogit" })

-- open diffview
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true, desc = "Open diffview" })

-- close diffview when inside of it
vim.keymap.set("n", "<leader>gde", "<cmd>DiffviewClose<CR>", { noremap = true, silent = true, desc = "Close diffview" })

-- Config from: https://github.com/MariaSolOs/dotfiles/blob/3f5badf4ba9a810bd5f2b5d94acff144a05e7d5e/.config/nvim/lua/keymaps.lua#L5C1-L9C64
-- Keeping the cursor centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous result" })

-- Config from: https://github.com/MariaSolOs/dotfiles/blob/3f5badf4ba9a810bd5f2b5d94acff144a05e7d5e/.config/nvim/lua/keymaps.lua#L11C1-L13C32
-- Indent while remaining in visual mode.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Config from: https://github.com/MariaSolOs/dotfiles/blob/3f5badf4ba9a810bd5f2b5d94acff144a05e7d5e/.config/nvim/lua/keymaps.lua#L32C1-L39C81
-- Poweful <esc>.
vim.keymap.set({ "i", "s", "n" }, "<esc>", function()
  if require("luasnip").expand_or_jumpable() then
    require("luasnip").unlink_current()
  end
  vim.cmd("noh")
  return "<esc>"
end, { desc = "Escape, clear hlsearch, and stop snippet session", expr = true })

-- Config from: https://github.com/MariaSolOs/dotfiles/blob/3f5badf4ba9a810bd5f2b5d94acff144a05e7d5e/.config/nvim/lua/keymaps.lua#L44C1-L45C112
-- escape and save changes.
vim.keymap.set({ "s", "i", "n", "v" }, "<C-s>", "<esc>:w<cr>", { desc = "Exit insert mode and save changes." })
