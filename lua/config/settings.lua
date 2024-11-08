local o = vim.opt

o.number = true
o.relativenumber = true
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.splitright = true
o.splitbelow = true
o.termguicolors = true

-- Python route for VENV
vim.g.python3_host_prog = '~/.venv/nvim/bin/python3'

-- Change identation tab spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ttimeoutlen = 0
