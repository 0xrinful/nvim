dofile(vim.g.base46_cache .. "telescope")

local actions = require("telescope.actions")

return {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    file_ignore_patterns = { ".git/" },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["u"] = actions.delete_buffer,
      },

      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-i>"] = actions.close,
        ["<C-o>"] = actions.toggle_selection,
        ["<C-l>"] = false,
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {
    ["ui-select"] = require("telescope.themes").get_dropdown({}),
  },
}
