-- Global variables.
vim.g.projects_dir = vim.env.HOME .. "/workspace/projects"
vim.g.personal_projects_dir = vim.g.projects_dir .. "/workspace/playground"
vim.g.work_projects_dir = "/git"

require("config.settings")
require("config.lazy")
require("config.keymaps")
require("config.float_term")
require("config.statusline")
require("config.winbar")

-- Reload configuration command and clear require modules cache.
vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^config") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
end, {})
