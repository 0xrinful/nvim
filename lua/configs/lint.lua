local lint = require("lint")

lint.linters_by_ft = {
  lua = { "luacheck" },
  python = { "ruff" },
  cpp = { "cpplint" },
  c = { "cpplint" },
  sh = { "shellcheck" },
  docker = { "hadolint" },
  solidity = { "solhint" },
  go = { "golangcilint" },
}

lint.linters.luacheck.args = {
  "--globals",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
