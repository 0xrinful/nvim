return {
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

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      local icons = { css = { icon = "", name = "Css" } }
      icons = vim.tbl_extend("keep", icons, require("nvchad.icons.devicons"))
      return { override = icons }
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require("configs.nvim-tree")
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      dofile(vim.g.base46_cache .. "git")
      return {
        signs = {
          delete = { text = "󰍵" },
          changedelete = { text = "󱕖" },
        },
      }
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
}
