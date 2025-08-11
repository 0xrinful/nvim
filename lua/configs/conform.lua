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

  format_on_save = function(bufnr)
    if vim.b[bufnr].disable_format then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,

  formatters = {
    sql_formatter = {
      prepend_args = { "--language", "postgresql" },
    },

    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused" },
    },
  },
}
