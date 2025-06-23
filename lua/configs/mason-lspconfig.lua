local servers = vim.tbl_keys(require("configs.lsp_handlers").servers)

local ignore_install = {}
local servers_to_install = {}

for _, server in ipairs(servers) do
  if not vim.tbl_contains(ignore_install, server) then
    table.insert(servers_to_install, server)
  end
end

return {
  ensure_installed = servers_to_install,
  automatic_installation = false,
}
