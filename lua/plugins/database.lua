return {
  {
    "2giosangmitom/sqmeow.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    version = "*",
    build = function()
      require("sqmeow").install()
    end,
    opts = {
      ui = {
        drawer = {
          position = "right",
        },
      },
    },
    cmd = "Sqmeow",
    keys = {
      { "<leader>Dd", "<cmd>Sqmeow toggle<cr>", desc = "Toggle" },
      { "<leader>Dc", "<cmd>Sqmeow cancel<cr>", desc = "Cancel" },
      { "<leader>Da", "<cmd>Sqmeow add<cr>", desc = "Add Connection" },
      { "<leader>Ds", "<cmd>Sqmeow scratch<cr>", desc = "New Scratchpad" },
    },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      {
        "tpope/vim-dadbod",
        config = function()
          vim.g.db_ui_save_location = vim.fn.stdpath("data") .. require("plenary.path").path.sep .. "db_ui"
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
}
