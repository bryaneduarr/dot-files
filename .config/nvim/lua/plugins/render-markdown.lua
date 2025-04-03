return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    bullet = {
      right_pad = 1,
    },
    file_types = { "markdown", "copilot-chat" },
    ft = { "markdown", "copilot-chat" },
  },
}
