require("env-loader").load_env()

return {
  "obsidian-nvim/obsidian.nvim",
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
    completion = {
      nvim_cmp = false,
      blink = true,
    },
  },
}
