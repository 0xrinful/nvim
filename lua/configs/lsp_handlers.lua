local M = {}
local map = vim.keymap.set

local lsp_hover = function()
  vim.lsp.buf.hover({ border = "rounded" })
end

local inc_rename = function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc, extra)
    return vim.tbl_extend("force", { buffer = bufnr, desc = "LSP " .. desc }, extra or {})
  end

  map("n", "<leader>gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "<leader>gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "<leader>gt", vim.lsp.buf.type_definition, opts("Go to type definition"))
  map("n", "<leader>gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))

  map("n", "K", lsp_hover, opts("Hover"))
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "<leader>ra", inc_rename, opts("Rename", { expr = true }))
  map("n", "<space>gr", "<cmd>Trouble lsp_references<cr>", opts("References"))
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.servers = {
  bashls = {},
  jsonls = {},
  cssls = {},
  html = {},
  solidity = {},
  dockerls = {},
  templ = {},

  lua_ls = {
    settings = {
      Lua = {
        codeLens = {
          enable = true,
        },
        completion = {
          callSnippet = "Replace",
        },
        doc = {
          privateName = { "^_" },
        },
        hint = {
          enable = true,
          setType = false,
          paramType = true,
          paramName = "Disable",
          semicolon = "Disable",
          arrayIndex = "Disable",
        },

        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          },
        },
      },
    },
  },

  -- Python
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = false,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
        },
      },
    },
  },

  -- Javascript - Typescript
  ts_ls = {},

  -- Emmet
  emmet_language_server = {
    init_options = {
      showSuggestionsAsSnippets = true,
    },

    filetypes = {
      "css",
      "html",
      "javascriptreact",
      "less",
      "pug",
      "sass",
      "scss",
      "typescriptreact",
      "htmlangular",
      "templ",
      "gotmpl",
    },
  },

  -- C/C++
  clangd = {
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  },

  -- Go
  gopls = {
    cmd = { "gopls" },
    filetypes = {
      "go",
      "gomod",
      "gowork",
    },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },

  jdtls = {},
}

return M
