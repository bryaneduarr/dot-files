return {
  "preservim/vim-pencil",
  ft = { "markdown" },
  config = function()
    vim.cmd("autocmd FileType markdown PencilSoft")
    vim.cmd("autocmd FileType markdown setlocal conceallevel=2")
  end,
}
