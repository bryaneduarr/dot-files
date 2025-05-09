require("env-loader").load_env()

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Define obsidian-specific ignore settings
    local obsidian_ignore_directory = vim.g.OBSIDIAN_NOTES
    local obsidian_ignore = {
      "templates/",
      "%.trash/",
      "assets/",
    }

    -- Dynamically set ignore patterns based on the current directory
    local function get_file_ignore_patterns()
      local base_patterns = {
        "package%-lock%.json",
        "pnpm%-lock%.yaml",
        "bun.lock",
        "%.obsidian.vimrc",
        "node_modules/",
        "%.smart%-env/",
        "%.next/",
        "%.obsidian/",
        "%.next/",
        "%.git/",
      }
      if vim.fn.getcwd() == obsidian_ignore_directory then
        -- Add obsidian-specific ignores
        vim.list_extend(base_patterns, obsidian_ignore)
      end
      return base_patterns
    end

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = get_file_ignore_patterns(), -- Dynamically set ignore patterns
        mappings = {
          i = {
            ["<c-d>"] = actions.delete_buffer,
          },
          n = {
            ["<c-d>"] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    })

    telescope.load_extension("fzf")

    -- Keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find string in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find opened buffers" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Fuzzy find git status." })
    keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Recently open files / old files." })
    keymap.set("n", "<leader>f?", ":Telescope keymaps<cr>", { desc = "Find keymaps" })
  end,
}
