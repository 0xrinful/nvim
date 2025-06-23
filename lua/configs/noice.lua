return {
  routes = {
    {
      view = "notify",
      filter = {
        event = "msg_showmode",
      },
    },

    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },

    -- {
    --   view = "notify",
    --   filter = {
    --     event = "msg_show",
    --     find = "written",
    --   },
    --   opts = { skip = false },
    -- },
  },

  messages = {},

  lsp = {
    progress = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },

    hover = {
      enabled = false,
    },

    signature = {
      enabled = true,
      opts = {
        size = {
          max_width = 100,
        },
      },
    },
  },

  presets = {
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
}
