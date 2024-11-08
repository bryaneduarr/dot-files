require("env-loader").load_env()

return {
  "goolord/alpha-nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local status_ok, alpha = pcall(require, "alpha")
    local dashboard = require("alpha.themes.dashboard")

    if not status_ok then
      return
    end

    dashboard.section.header.val = {
      [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
      [[  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
      [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
      [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
      [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
      [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("d", "  Open current directory in oil", ":Oil<CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("o", "  Open Vault", ":Oil" .. vim.g.OBSIDIAN_NOTES .. "<CR>"),
      dashboard.button("u", "  New Unlinked Note", ":ObsidianNew <CR>"),
      dashboard.button("c", "  Configuration", ":Oil ~/.config/nvim<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
