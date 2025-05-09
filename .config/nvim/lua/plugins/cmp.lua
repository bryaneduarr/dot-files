return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    "Kaiser-Yang/blink-cmp-avante",
    "L3MON4D3/LuaSnip",
  },
  version = "1.*",
  opts = {
    keymap = { ["<CR>"] = { "accept", "fallback" } },
    completion = {
      list = {
        -- Insert items while navigating the completion list.
        selection = { preselect = false, auto_insert = true },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 0 },
    },
    snippets = { preset = "luasnip" },
    sources = {
      default = { "avante", "lsp", "path", "snippets", "buffer" },
      providers = {
        --   copilot = {
        --     module = "blink-copilot",
        --   },
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {},
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
