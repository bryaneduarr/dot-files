return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    config = function()
      -- vim.cmd("colorscheme vscode")
    end,
  },
  {
    "dgox16/oldworld.nvim",
    priority = 1000,
    lazy = false,
    name = "oldworld",
    config = function()
      require("oldworld").setup({
        variant = "oled",
        integrations = {
          telescope = false,
        }
      })
      vim.cmd.colorscheme("oldworld")
    end,
  },
}
