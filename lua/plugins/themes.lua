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
      vim.cmd("colorscheme vscode")
    end,
  },
  {
    "CosecSecCot/midnight-desert.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    name = "midnight-desert",
    config = function()
      -- vim.cmd.colorscheme("midnight-desert")
    end,
  },
  {
    "water-sucks/darkrose.nvim",
    name = "darkrose",
    config = function()
      -- vim.cmd.colorscheme("darkrose")
    end,
  },
  {
    "Shadorain/shadotheme",
    name = "shadotheme",
    config = function()
      -- vim.cmd.colorscheme("shadotheme")
    end,
  },
  {
    "p00f/alabaster.nvim",
    name = "alabaster",
    config = function()
      -- vim.cmd.colorscheme("alabaster")
    end,
  },
  {
    "yorumicolors/yorumi.nvim",
    name = "yorumi",
    config = function()
      -- vim.cmd.colorscheme("yorumi")
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    name = "modus-themes",
    config = function()
      -- vim.cmd.colorscheme("modus-vivendi")
    end,
  },
}
