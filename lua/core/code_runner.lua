local M = {}

-- Quick access to path expansions
local function expand(path)
  return vim.fn.expand(path)
end
local function quote(str)
  return vim.fn.shellescape(str)
end

-- Complex logic handlers
local handlers = {
  go = function()
    return vim.fn.filereadable(vim.fn.getcwd() .. "/go.mod") == 1 and "go run ." or "go run " .. quote(expand("%:t"))
  end,

  cpp = function()
    local file, out = quote(expand("%:t")), expand("%:t:r")
    return string.format("g++ -std=c++14 %s -o %s && ./%s && rm %s", file, out, out, out)
  end,

  c = function()
    local file, out = quote(expand("%:t")), expand("%:t:r")
    return string.format("gcc %s -o %s && ./%s && rm %s", file, out, out, out)
  end,

  java = function()
    return string.format("javac %s && java %s", expand("%:t"), expand("%:t:r"))
  end,
}

-- Simple template-based commands
local templates = {
  python = "python3 %s",
  sh = "bash %s",
  lua = "lua %s",
  javascript = "node %s",
  cs = "dotnet run",
  html = "live-server --open=%s --no-css-inject",
}

M.run = function()
  local ft = vim.bo.filetype
  local cmd

  if handlers[ft] then
    cmd = handlers[ft]()
  elseif templates[ft] then
    -- Insert the full path into the %s placeholder if it exists
    local path = templates[ft]:find("%%s") and quote(expand("%:p")) or ""
    cmd = string.format(templates[ft], path)
  end

  if not cmd then
    vim.notify("No runner for: " .. ft, vim.log.levels.WARN)
    return
  end

  require("nvchad.term").runner({
    cmd = cmd,
    id = "floatTerm",
    pos = "float",
  })
end

return M
