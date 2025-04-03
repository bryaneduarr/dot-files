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
vim.keymap.set("n", "<M-k>", ":wincmd k<CR>", { desc = "Move to top pane" })
vim.keymap.set("n", "<M-j>", ":wincmd j<CR>", { desc = "Move to bottom pane" })
vim.keymap.set("n", "<M-h>", ":wincmd h<CR>", { desc = "Move to left pane" })
vim.keymap.set("n", "<M-l>", ":wincmd l<CR>", { desc = "Move to right pane" })

-- Change between buffers
vim.keymap.set("n", "<c-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Change to next buffer" })
vim.keymap.set("n", "<c-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Change to previous buffer." })

-- move line up and down in normal mode
vim.keymap.set("n", "<S-k>", "ddkP", { noremap = true, silent = true, desc = "Move line up in normal mode." })
vim.keymap.set("n", "<S-j>", "ddp", { noremap = true, silent = true, desc = "Move line down in normal mode." })

-- copy outside editor
vim.keymap.set("v", "<S-y>", '"+y', { noremap = true, silent = true, desc = "Copy line to system clipboard." })
