return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.16, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        mocha = {
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#ef79ab",
          -- mauve = "#FF8F40",
          red = "#E66767",
          maroon = "#EB788B",
          peach = "#FAB770",
          yellow = "#8ba1f0",
          green = "#a6e3a1",
          teal = "#f3b7cd",
          -- sky = "#61BDFF",
          sapphire = "#4BA8FA",
          blue = "#f3b864",
          -- lavender = "#00BBCC",
          text = "#C1C9E6",
          subtext1 = "#A3AAC2",
          subtext0 = "#8E94AB",
          overlay2 = "#7D8296",
          overlay1 = "#676B80",
          overlay0 = "#464957",
          surface2 = "#3A3D4A",
          surface1 = "#2F313D",
          surface0 = "#11121A",
          base = "#0e0d0f",
          mantle = "#0e0d0f",
          crust = "#0e0d0f",
        },
      },
      custom_highlights = {
        -- Better highlighting for variables in TypeScript/React
        ["@variable"] = { fg = "#87cdff" },
        ["@variable.parameter"] = { fg = "#C4A7E7" },
        ["@property"] = { fg = "#EBBCBA" },
        ["TSParameter"] = { fg = "#C4A7E7" },
        ["TSVariable"] = { fg = "#87cdff" },
        ["TSVariableBuiltin"] = { fg = "#F6C177" },
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    config = function()
      -- vim.cmd("colorscheme vscode")
    end,
  },
}
