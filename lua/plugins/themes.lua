return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    config = function()
      -- vim.cmd("colorscheme vscode")
    end,
  },
}
