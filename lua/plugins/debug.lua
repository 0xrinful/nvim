return {
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
      "nvim-telescope/telescope.nvim",

      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
}
