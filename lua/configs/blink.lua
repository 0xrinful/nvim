dofile(vim.g.base46_cache .. "blink")

local opts = {
  snippets = {
    preset = "luasnip",
  },

  cmdline = {
    enabled = true,
    keymap = {
      preset = "inherit",
      ["<Tab>"] = { "accept" },
      ["<CR>"] = { "accept_and_enter", "fallback" },
    },

    completion = {
      menu = { auto_show = true },
      list = { selection = { preselect = false, auto_insert = true } },
    },
  },

  appearance = { nerd_font_variant = "normal" },

  signature = {
    enabled = false,
    window = {
      show_documentation = true,
      border = "rounded",
    },
  },

  keymap = {
    preset = "none",
    ["<CR>"] = { "accept", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },

    ["<C-p>"] = { "hide" },
    ["<C-n>"] = { "show" },
    ["<C-y>"] = { "show_documentation", "hide_documentation" },

    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },

  completion = {
    ghost_text = { enabled = true },
    accept = {
      auto_brackets = { kind_resolution = { blocked_filetypes = { "css", "sql" } } },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 150,
      window = { border = "rounded" },
    },
    menu = require("nvchad.blink").menu,

    trigger = {
      show_on_accept_on_trigger_character = true,
      show_on_trigger_character = true,
      show_on_blocked_trigger_characters = { " ", "\n", "\t", "}" },
      show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "[", ">" },
    },
  },

  fuzzy = {
    implementation = "rust",
    sorts = {
      function(a, b)
        local ft = vim.bo.filetype
        if ft ~= "javascriptreact" and ft ~= "typescriptreact" then
          return
        end

        if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
          return
        end
        return b.client_name == "emmet_language_server"
      end,

      -- "exact",
      "score",
      "sort_text",
    },
  },

  sources = {
    default = { "lsp", "snippets", "buffer", "path" },
    per_filetype = {
      sql = { "snippets", "dadbod" },
      mysql = { "snippets", "dadbod" },
    },
    providers = {
      dadbod = {
        name = "dadbod",
        module = "vim_dadbod_completion.blink",
      },
      path = {
        opts = {
          get_cwd = function(_)
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },
}

return opts
