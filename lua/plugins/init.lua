return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require("nvchad")
    end,
  },

  "nvchad/volt",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      local icons = { css = { icon = "", name = "Css" } }
      icons = vim.tbl_extend("keep", icons, require("nvchad.icons.devicons"))
      return { override = icons }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar", show_start = false, show_end = false },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require("configs.nvimtree")
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require("configs.gitsigns")
    end,
  },

  -- lsp stuff
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require("configs.mason")
    end,
    config = function(_, opts)
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
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      return require("configs.mason-lspconfig")
    end,
  },

  -- formatting!
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require("configs.conform")
    end,
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = { "conform.nvim" },
    opts = { ignore_install = {} },
  },

  -- linting!
  {
    "mfussenegger/nvim-lint",
    event = { "User FilePost" },
    config = function()
      require("configs.lint")
    end,
  },

  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "nvim-lint" },
    opts = function()
      return require("configs.mason-lint")
    end,
  },

  -- completion!
  {
    -- snippet plugin
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require("configs.luasnip")
    end,
  },

  -- autopairing of (){}[] etc
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
    },

    opts_extend = { "sources.default" },
    opts = function()
      return require("configs.blink")
    end,
  },

  -- debugging!
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapToggleBreakpoint", "DapContinue" },
    config = function()
      require("configs.dap")
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function()
      return require("configs.mason-dap")
    end,
  },

  -- database!
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      {
        "tpope/vim-dadbod",
        config = function()
          require("configs.dadbod")
        end,
      },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } }, -- Optional
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_win_position = "right"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    ft = { "man" },
    opts = function()
      return require("configs.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      return require("configs.noice")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      { "rcarriga/nvim-notify", opts = { background_colour = "#000000" }, module = "notify" },
    },
  },

  {
    "smjonas/inc-rename.nvim",
    event = "User FilePost",
    opts = {},
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "User FilePost",
    config = function()
      dofile(vim.g.base46_cache .. "rainbowdelimiters")
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    cmd = "Markdown",
    config = function()
      require("render-markdown").toggle()
    end,
  },

  {
    "matze/vim-move",
    event = "User FilePost",
  },

  {
    "echasnovski/mini.ai",
    event = "User FilePost",
    opts = {},
  },

  {
    "echasnovski/mini.operators",
    event = "User FilePost",
    config = function()
      require("mini.operators").setup({
        replace = { prefix = "s" },
      })
      local map = vim.keymap.set
      map("n", "S", "s$", { remap = true })
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    keys = { { "<c-[>", desc = "Join Toggle" } },
    event = "User FilePost",
    opts = { mappings = { toggle = "<C-[>" } },
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "User FilePost",
    opts = {},
  },

  {
    "MagicDuck/grug-far.nvim",
    opts = function()
      dofile(vim.g.base46_cache .. "grug_far")
      return { headerMaxWidth = 30 }
    end,
    cmd = "GrugFar",
  },

  {
    "folke/ts-comments.nvim",
    event = "User FilePost",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = function()
      return require("configs.kulala")
    end,
  },

  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User FilePost",
    opts = {},
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>ll", "<cmd>Leet<cr>", desc = "Open LeetCode" },
      { "<leader>lc", "<cmd>Leet console<cr>", desc = "Open Console" },
      { "<leader>lq", "<cmd>Leet list<cr>", desc = "List Questions" },
      { "<leader>ld", "<cmd>Leet desc<cr>", desc = "View Question" },
      { "<leader>lr", "<cmd>Leet run<cr>", desc = "Run Code" },
      { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Submit Code" },
    },
    opts = { lang = "golang" },
  },
}
