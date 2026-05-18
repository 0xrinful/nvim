return {
  "nvim-lua/plenary.nvim",

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

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
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
    ft = "markdown",
    opts = {},
  },

  {
    "matze/vim-move",
    event = "User FilePost",
  },

  {
    "echasnovski/mini.ai",
    event = "User FilePost",
    opts = {
      custom_textobjects = {
        t = false,
      },

      mappings = {
        around_next = "aN",
        inside_next = "iN",
        around_last = "aP",
        inside_last = "iP",
      },
    },
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
    opts = {
      global_keymaps = {
        ["Send request"] = {
          "<leader>rp",
          function()
            require("kulala").run()
          end,
          mode = { "n", "v" },
          desc = "Send request",
        },
      },
      ui = {
        icons = {
          inlay = {
            loading = "󰔛",
            done = "󰸞",
            error = "󰅖",
          },
        },
      },
    },
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
