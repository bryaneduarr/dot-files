return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    config = function()
      -- vim.cmd("colorscheme vscode")
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("moonfly")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
  },
  {
    "vague2k/vague.nvim",
  },
  {
    "jnurmine/Zenburn",
  },
  {
    "RRethy/base16-nvim",
  },
}
