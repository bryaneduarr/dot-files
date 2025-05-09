-- Track the LSP progress.
local progress_status = {}

-- Get icons from config
local icons = require("config.icons")

-- Format the file path to show only the last three directories
_G.file_path_component = function()
  local full_path = vim.fn.expand("%:p")
  local home_dir = vim.fn.expand("$HOME")

  -- Replace home directory with ~
  local path = full_path:gsub(home_dir, "~")

  -- Split the path by directory separator
  local parts = {}
  for part in string.gmatch(path, "([^/]+)") do
    table.insert(parts, part)
  end

  -- Get the last three parts (or fewer if there aren't three)
  local last_parts = {}
  local start_idx = math.max(1, #parts - 2) -- Start from third-last part

  for i = start_idx, #parts do
    table.insert(last_parts, parts[i])
  end

  -- Construct the shortened path
  local short_path = table.concat(last_parts, "/")

  -- Add highlighting
  return short_path
end

-- Store last diagnostic component value to avoid flicker in insert mode
local last_diagnostic_component = ""

-- Function to show VCS (Version Control System) status using git signs.
_G.vcs_status = function()
  -- Get git information from `gitsigns` plugin.
  -- gitsigns_status_dict contains: head (branch), added, changed, removed counts.
  local git_info = vim.b.gitsigns_status_dict

  -- If no git info available or not in a git repo, return empty string.
  if not git_info or git_info.head == "" then
    return ""
  end

  -- Format the added/changed/removed counters with appropriate symbols.
  -- + for added files, ~ for changed files, - for removed files.
  local added = git_info.added and ("+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("-" .. git_info.removed .. " ") or ""

  -- Don't show counters if they are zero.
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end

  -- Concatenate all elements for the final git status display.
  return table.concat({
    "", -- Opening bracket.
    added,
    changed,
    removed,
    "", -- Closing bracket.
    git_info.head, -- Git branch name.
  })
end

-- Create autocmd to track LSP progress for statusline updates.
-- Inspiration from: https://github.com/MariaSolOs/dotfiles/blob/30838ba4e6ba60334b8c2185d40eca8be02e8ff3/.config/nvim/lua/statusline.lua#L128-L154
vim.api.nvim_create_autocmd("LspProgress", {
  group = vim.api.nvim_create_augroup("statusline_lsp_progress", { clear = true }),
  desc = "Update LSP progress in statusline",
  pattern = { "begin", "end" },
  callback = function(args)
    -- This should in theory never happen, but I've seen weird errors.
    if not args.data then
      return
    end

    -- Get the client and progress details.
    progress_status = {
      client = vim.lsp.get_client_by_id(args.data.client_id).name,
      kind = args.data.params.value.kind,
      title = args.data.params.value.title,
    }

    if progress_status.kind == "end" then
      progress_status.title = nil
      -- Wait a bit before clearing the status.
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 3000)
    else
      vim.cmd.redrawstatus()
    end
  end,
})

--- Display the latest LSP progress message in the statusline.
--- Inspiration from: https://github.com/MariaSolOs/dotfiles/blob/30838ba4e6ba60334b8c2185d40eca8be02e8ff3/.config/nvim/lua/statusline.lua#L157-L172
---@return string LSP
_G.lsp_progress = function()
  -- If no progress status is available, return an empty string.
  if not progress_status.client or not progress_status.title then
    return ""
  end

  -- Avoid noisy messages while typing.
  if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
    return ""
  end

  return table.concat({
    string.format("%s ", progress_status.client),
    string.format("%s... ", progress_status.title),
  })
end

--- Diagnostic counts in the current buffer.
--- Inspiration from: https://github.com/MariaSolOs/dotfiles/blob/30838ba4e6ba60334b8c2185d40eca8be02e8ff3/.config/nvim/lua/statusline.lua#L174-L211
---@return string Formatted diagnostic component for statusline
_G.diagnostics_component = function()
  -- Lazy uses diagnostic icons, but those aren't errors per se.
  if vim.bo.filetype == "lazy" then
    return ""
  end

  -- Use the last computed value if in insert mode.
  if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
    return last_diagnostic_component
  end

  local counts = vim.iter(vim.diagnostic.get(0)):fold({
    ERROR = 0,
    WARN = 0,
    HINT = 0,
    INFO = 0,
  }, function(acc, diagnostic)
    local severity = vim.diagnostic.severity[diagnostic.severity]
    acc[severity] = acc[severity] + 1
    return acc
  end)

  local parts = vim
    .iter(counts)
    :map(function(severity, count)
      if count == 0 then
        return nil
      end

      return string.format("%s %d", icons.diagnostics[severity], count)
    end)
    :totable()

  last_diagnostic_component = table.concat(parts, " ")
  return last_diagnostic_component
end

-- Configure the statusline with the following components:
-- %{v:lua.file_path_component()} - Last three folders/filename with custom color
-- %h%m%r                - Help flag, Modified flag, Read only flag
-- %=                    - Switch to right side alignment
-- %{v:lua.diagnostics_component()} - Show diagnostic counts
-- %{v:lua.lsp_progress()} - Show LSP progress status
-- %{v:lua.vcs_status()} - Call custom git status function
-- %l:%c                 - Current line and column position
vim.opt.statusline =
  "%{v:lua.file_path_component()} %h%m%r%= %{v:lua.diagnostics_component()} %{v:lua.lsp_progress()}%{v:lua.vcs_status()} %l:%c"
