return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      per_filetype = {
        ["html"] = {
          enable_close = true,
        },
      },
    })
  end,
}
