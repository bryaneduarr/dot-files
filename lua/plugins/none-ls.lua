return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black.with({ extra_args = { "--line-length", "88" } }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome,
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format()
      vim.cmd("w!")
    end, {})
  end,
}
