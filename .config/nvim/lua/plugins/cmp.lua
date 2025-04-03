return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },
  version = "1.*",
  opts = {
    keymap = { ["<CR>"] = { "accept", "fallback" } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      -- providers = {
      --   copilot = {
      --     module = "blink-copilot",
      --   },
      -- },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
