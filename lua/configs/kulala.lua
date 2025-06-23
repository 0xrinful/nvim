return {
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
}
