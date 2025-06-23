--- @type ChadrcConfig
local M = {}

M.base46 = {
  theme = "jabuti",
  transparency = true,

  hl_add = {
    NotificationInfo = { fg = "#80A0FF", bg = "#1F2335" },
  },
  integrations = { "rainbowdelimiters", "dap", "grug_far" },
}

M.nvdash = {
  load_on_startup = true,
}

M.ui = {
  statusline = {
    theme = "vscode",
  },
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
}

M.lsp = {
  signature = false,
}

return M
