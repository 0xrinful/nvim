return {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    python = { "ruff_format" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    markdown = { "prettierd" },
    json = { "fixjson" },
    jsonc = { "fixjson" },
    sh = { "shfmt" },
    html = { "prettierd" },
    css = { "prettierd" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    sql = { "sql_formatter" },
    mysql = { "sql_formatter" },
    templ = { "templ" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    sql_formatter = {
      prepend_args = { "--language", "postgresql" },
    },
  },
}
