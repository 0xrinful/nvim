dofile(vim.g.base46_cache .. "lsp")

local handlers = require("configs.lsp_handlers")

require("nvchad.lsp").diagnostic_config()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    handlers.on_attach(_, args.buf)
  end,
})

handlers.capabilities = vim.tbl_deep_extend("force", handlers.capabilities, require("blink.cmp").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = handlers.capabilities, on_init = handlers.on_init })

for lsp, config in pairs(handlers.servers) do
  vim.lsp.config(lsp, config)
  vim.lsp.enable(lsp)
end
