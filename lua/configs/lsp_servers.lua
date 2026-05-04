return {
  bashls = {},
  jsonls = {},
  cssls = {},
  html = {},

  -- Lua
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
  ty = {
    settings = {
      ty = {
        diagnosticMode = "workspace",
        completions = {
          autoImport = false,
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
      "template",
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

  asm_lsp = {},
}
