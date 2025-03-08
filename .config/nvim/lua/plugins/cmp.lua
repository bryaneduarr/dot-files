-- return {
--   "saghen/blink.cmp",
--   version = "v0.*",
--   opts_extend = { "sources.default", "sources.compat" },
--   dependencies = {
--     {
--       "L3MON4D3/LuaSnip",
--       lazy = true,
--       dependencies = {
--         {
--           "rafamadriz/friendly-snippets",
--           config = function()
--             require("luasnip.loaders.from_vscode").lazy_load()
--             require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
--           end,
--         },
--       },
--       -- opts = { history = true, delete_check_events = "TextChanged" },
--     },
--   },
--   opts = function()
--     return {
--       snippets = {
--         preset = "luasnip",
--       },
--       sources = {
--         default = { "lsp", "path", "snippets", "buffer" },
--         providers = {
--           lsp = {
--             name = "lsp",
--             score_offset = 300,
--           },
--           buffer = {
--             name = "buffer",
--             score_offset = 50,
--           },
--           snippets = {
--             name = "snippets",
--             score_offset = 100,
--           },
--         },
--       },
--       completion = {
--         menu = {
--           draw = { treesitter = { "lsp" } },
--         },
--         trigger = {
--           show_on_keyword = true,
--         },
--         documentation = {
--           auto_show = true,
--           auto_show_delay_ms = 0,
--           window = {
--             border = "rounded",
--           },
--         },
--       },
--     }
--   end,
-- }
--

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        -- { name = "codeium" },
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
