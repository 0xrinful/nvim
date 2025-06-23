local lint = package.loaded["lint"]

-- List of linters to ignore during install
local ignore_install = {
  "luacheck",
}

-- Build a list of linters to install minus the ignored list.
local all_linters = {}
for _, ft in pairs(lint.linters_by_ft) do
  for _, linter in ipairs(ft) do
    if not vim.tbl_contains(all_linters, linter) and not vim.tbl_contains(ignore_install, linter) then
      table.insert(all_linters, linter)
    end
  end
end

return {
  ensure_installed = all_linters,
  automatic_installation = false,
}
