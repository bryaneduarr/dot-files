local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- leader
vim.g.mapleader = " "

-- default explorer
vim.keymap.set("n", "<leader>ep", vim.cmd.Explore)

-- exit file
vim.keymap.set("n", "<leader>q", ":q<CR>", {})

-- close current buffer/tab
vim.keymap.set("n", "<leader>bq", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer/tab" })

-- close all buffers/tab
vim.keymap.set("n", "<leader>baq", ":w | %bd | e#", { desc = "Close all buffers/tab" })

-- save  file
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>", { silent = true })

-- dismiss notifications with noice
vim.keymap.set("n", "<leader>nd", "<CMD>NoiceDismiss<CR>", { desc = "Dismiss Noice notification" })

-- return to alpha main menu
vim.keymap.set("n", "<leader>A", ":Alpha<CR>", { desc = "Return to alpha main menu" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- split window
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Split vertically the window" })
vim.keymap.set("n", "<leader>s", ":split<CR>", { desc = "Split horizontal the window" })

-- Navigate vim panes better
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Change between buffers
vim.keymap.set("n", "<c-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Change to next buffer" })
vim.keymap.set("n", "<c-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Change to previous buffer." })

-- while on insert move the cursor with hjkl and control
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true, desc = "Move to left while in insert mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true, desc = "Move to left while in insert mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true, desc = "Move to left while in insert mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true, desc = "Move to left while in insert mode" })

-- move line up and down in normal mode
vim.keymap.set("n", "<S-k>", "ddkP", { noremap = true, silent = true, desc = "Move line up in normal mode." })
vim.keymap.set("n", "<S-j>", "ddp", { noremap = true, silent = true, desc = "Move line down in normal mode." })

-- open nvim tree
vim.keymap.set(
  "n",
  "<leader>e",
  ":NvimTreeToggle",
  { noremap = true, silent = true, desc = "Toggle nvim tree plugin." }
)

-- copy outside editor
vim.keymap.set("v", "<S-y>", '"+y', { noremap = true, silent = true, desc = "Copy line to system clipboard." })
