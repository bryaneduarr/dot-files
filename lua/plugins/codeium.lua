return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      virtual_text = {
        enabled = true,
        filetypes = {
          markdown = false,
        },
        key_bindings = {
          -- Accept the next word with "LEFT ALT + w".
          accept_word = "<M-w>",
          -- Accept the next line with "LEFT ALT + l".
          accept_line = "<M-l>",
          -- Cycle to the next completion.
          next = "<M-]>",
          -- Cycle to the previous completion.
          prev = "<M-[>",
          -- Clear the virtual text.
          clear = false,
        },
      },
    })
  end,
}
