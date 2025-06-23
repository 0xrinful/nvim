local M = {}

local quote = function(str)
  return vim.fn.shellescape(str)
end

local get_filename = function()
  return vim.fn.expand("%:t")
end

local get_filename_without_ext = function()
  return vim.fn.expand("%:t:r")
end

local get_fullpath = function()
  return vim.fn.expand("%:p")
end

local go_cmd = function()
  local root = vim.fn.getcwd()
  if vim.fn.filereadable(root .. "/go.mod") == 1 then
    return "go run ."
  end
  return "go run " .. quote(get_filename())
end

local cpp_cmd = function()
  local filename = get_filename()
  local outfile = get_filename_without_ext()
  return string.format("g++ -std=c++14 %s -o %s && ./%s && rm ./%s", quote(filename), outfile, outfile, outfile)
end

local cmd_map = {
  go = go_cmd,
  cpp = cpp_cmd,

  python = function()
    return "python3 " .. quote(get_fullpath())
  end,

  sh = function()
    return "bash " .. quote(get_fullpath())
  end,

  lua = function()
    return "lua " .. quote(get_fullpath())
  end,

  cs = function()
    return "dotnet run"
  end,

  html = function()
    return "live-server --open=" .. get_filename() .. " --no-css-inject"
  end,

  javascript = function()
    return "node " .. quote(get_fullpath())
  end,

  java = function()
    return "javac " .. get_filename() .. " && java " .. get_filename_without_ext()
  end,
}

local function get_cmd()
  local ft = vim.bo.filetype
  local runner = cmd_map[ft]
  return runner and runner() or nil
end

M.run = function()
  local cmd = get_cmd()
  if not cmd then
    vim.notify("Unsupported filetype for code runner: " .. vim.bo.filetype, vim.log.levels.WARN)
    return
  end

  -- if #cmd <= 50 then
  --   print(cmd)
  -- end

  require("nvchad.term").runner({
    cmd = cmd,
    id = "floatTerm",
    pos = "float",
  })
end

return M
