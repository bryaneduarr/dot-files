return {
  "folke/which-key.nvim",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
    },
    {
      -- Define a group for Obsidian-related commands
      "<leader>o",
      group = "Obsidian",
    },
  },
}
