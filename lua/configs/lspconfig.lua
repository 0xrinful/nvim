dofile(vim.g.base46_cache .. "lsp")

local map = vim.keymap.set

require("nvchad.lsp").diagnostic_config()

local lsp_hover = function()
  vim.lsp.buf.hover({ border = "rounded" })
end

local inc_rename = function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end

local on_attach = function(_, bufnr)
  local function opts(desc, extra)
    return vim.tbl_extend("force", { buffer = bufnr, desc = "LSP " .. desc }, extra or {})
  end

  -- Navigation & Info
  map("n", "<leader>gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "<leader>gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "<leader>gt", vim.lsp.buf.type_definition, opts("Go to type definition"))
  map("n", "<leader>gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "K", lsp_hover, opts("Hover"))
  map("n", "<space>gr", "<cmd>Trouble lsp_references<cr>", opts("References"))

  -- Workspace
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

  -- Actions
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "<leader>ra", inc_rename, opts("Rename", { expr = true }))
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach(_, args.buf)
  end,
})

local on_init = function(client, _)
  if client:supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })

local lsp_servers = require("configs.lsp_servers")
for lsp, config in pairs(lsp_servers) do
  vim.lsp.config(lsp, config)
  vim.lsp.enable(lsp)
end
