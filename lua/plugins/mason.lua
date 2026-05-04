return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      PATH = "skip",
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      max_concurrent_installers = 10,
    },

    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")

      require("mason").setup(opts)
      vim.schedule(function()
        require("mason-lspconfig")
        require("mason-conform")
        require("mason-nvim-dap")
        require("mason-nvim-lint")
      end)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      local servers = vim.tbl_keys(require("configs.lsp_servers"))

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
    end,
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = { "conform.nvim" },
    opts = { ignore_install = {} },
  },

  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "nvim-lint" },
    opts = function()
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
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {},
      ensure_installed = {
        "delve",
        "codelldb",
        "python",
      },
    },
  },
}
