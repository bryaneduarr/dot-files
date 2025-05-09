return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        liquid = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        -- For filetypes without a formatter:
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1000,
      },
      format_after_save = {
        lsp_format = "first",
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
      vim.g.autoformat = true
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
