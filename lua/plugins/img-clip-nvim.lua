require("env-loader").load_env()

return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = function()
        local current_path = vim.fn.expand("%:p:h")
        local target_path = vim.g.OBSIDIAN_NOTES

        if current_path:find(target_path) then
          return "assets"
        else
          return "."
        end
      end,
      extension = "png",
      file_name = "%Y-%m-%d-%H-%M-%S",
      use_absolute_path = false,
      relative_to_current_file = true,
      prompt_for_file_name = true,
    },
    filetypes = {
      markdown = {
        template = "![$CURSOR]($FILE_PATH)",
        url_encode_path = true,
      },
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
