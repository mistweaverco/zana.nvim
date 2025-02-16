local function normalize_path(path)
  local parts = {}
  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

  -- Convert Windows backslashes to forward slashes for consistency
  if is_windows then
    path = path:gsub("\\", "/")
  end

  for part in string.gmatch(path, "[^/]+") do
    if part == ".." then
      if #parts > 0 then
        table.remove(parts) -- Go up one directory
      end
    elseif part ~= "." and part ~= "" then
      table.insert(parts, part)
    end
  end

  local normalized = (is_windows and "" or "/") .. table.concat(parts, "/")

  -- Convert backslashes for Windows paths
  if is_windows then
    normalized = normalized:gsub("/", "\\")
  end

  return normalized
end

local IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"
local PS = IS_WINDOWS and "\\" or "/"
local PATH_SEPARATOR = IS_WINDOWS and ";" or ":"

local getHomePath = function()
  local path = vim.fn.stdpath("config") .. PS .. ".." .. PS .. "zana"
  return normalize_path(path)
end

local getAppPackagesPath = function()
  return getHomePath() .. PS .. "packages"
end

local getNPMPath = function()
  return getAppPackagesPath() .. PS .. "npm" .. PS .. "node_modules" .. PS .. ".bin"
end

local getPyPiPath = function()
  return getAppPackagesPath() .. PS .. "pypi" .. PS .. "pkgs" .. PS .. "bin"
end

vim.notify("Setting PATH to " .. getNPMPath(), "info")

vim.env.PATH = getNPMPath() .. PATH_SEPARATOR .. getPyPiPath() .. PATH_SEPARATOR .. vim.env.PATH
vim.fn.setenv("PATH", vim.env.PATH)

return {
  setup = function() end,
}
