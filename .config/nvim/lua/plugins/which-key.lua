return {
  "folke/which-key.nvim",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
    },
  },
  opts = {
    spec = {
      { "<leader>z", group = "ai" },
      { "<leader>gm", group = "Copilot Chat" },
    },
  },
}
