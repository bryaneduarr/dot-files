-- Display absolute line numbers in the left margin.
vim.opt.number = true

-- Enable relative line numbering for easier navigation (shows distance from current line).
vim.opt.relativenumber = true

-- Enable syntax highlighting for better code readability.
vim.opt.syntax = "on"

-- Automatically indent new lines based on the previous line's indentation.
vim.opt.autoindent = true

-- Highlight the line the cursor is currently on for better visibility.
vim.opt.cursorline = true

-- Set the number of spaces for each level of indentation when using >> or <<.
vim.opt.shiftwidth = 2

-- Set the number of spaces that a tab character represents.
vim.opt.tabstop = 2

-- Set the character encoding used inside Neovim to UTF-8 (supports international characters).
vim.opt.encoding = "UTF-8"

-- Enable true color support for terminals that support it (better color rendering).
vim.opt.termguicolors = true

-- Enable spell checking functionality, automatically underlines misspelled words as you type.
vim.opt.spell = true

-- Set spell checking languages to Spanish and English, Neovim will use dictionaries for both languages to check spelling.
vim.opt.spelllang = { "es", "en" }

-- Hide Netwr banner (the message that appears when you open a directory).
vim.g.netrw_banner = 0

-- Keep the current directory when opening a file.
vim.g.netrw_keepdir = 0

-- Enable Netwr to open files in a preview window.
vim.g.netrw_preview = 1

-- Save undo history.
vim.o.undofile = true

-- Show whitespace.
vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }
