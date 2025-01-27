local o = vim.opt

o.number = true
o.relativenumber = true
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.encoding = "UTF-8"
o.splitright = true
o.splitbelow = true
o.termguicolors = true

-- Change identation tab spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Cursor line
vim.opt.cursorline = true

-- Function to show VCS status git signs.
_G.vcs_status = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat({
    "",
    added,
    changed,
    removed,
    "",
    git_info.head,
  })
end

-- Status line
vim.opt.statusline = "%f %h%m%r%= %{v:lua.vcs_status()} %l:%c"
