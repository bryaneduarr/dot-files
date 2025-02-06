require("env-loader").load_env()

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.g.OBSIDIAN_NOTES,
      },
    },
    templates = {
      folder = "templates",
    },
  },
}
