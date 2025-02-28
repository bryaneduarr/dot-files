local M = {}

function M.load_env()
  local env_file = os.getenv("HOME") .. "/.config/nvim/.env"
  local file = io.open(env_file, "r")
  if file then
    for line in file:lines() do
      local key, value = line:match("^(%S+)=(.*)$")
      if key and value then
        vim.g[key] = value
      end
    end
    file:close()
  end
end

return M
