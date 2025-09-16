local map = vim.keymap.set

local cmder = function(command)
  return "<cmd>" .. command .. "<CR>"
end

-- Insert mode navigation
map("i", "<C-h>", "<Left>", { desc = "insert | move left" })
map("i", "<C-l>", "<Right>", { desc = "insert | move right" })
map("i", "<C-j>", "<Down>", { desc = "insert | move down" })
map("i", "<C-k>", "<Up>", { desc = "insert | move up" })

-- Window movement
map("n", "<C-h>", "<C-w>h", { desc = "window | move left" })
map("n", "<C-l>", "<C-w>l", { desc = "window | move right" })
map("n", "<C-j>", "<C-w>j", { desc = "window | move down" })
map("n", "<C-k>", "<C-w>k", { desc = "window | move up" })

-- Clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "global | clear highlights" })

-- Buffer resizing
map("n", "<Right>", cmder("vertical resize +2"), { desc = "window | increase width" })
map("n", "<Left>", cmder("vertical resize -2"), { desc = "window | decrease width" })
map("n", "<Up>", cmder("resize +2"), { desc = "window | increase height" })
map("n", "<Down>", cmder("resize -2"), { desc = "window | decrease height" })

-- Comment toggling
map("n", "<C-/>", "gcc", { desc = "comment | toggle line", remap = true })
map("v", "<C-/>", "gc", { desc = "comment | toggle block", remap = true })

-- Mode exits
-- map("i", "<C-i>", "<ESC>", { desc = "insert | exit mode" })
map("i", "<C-i>", "<ESC>", { desc = "blink.cmp" })
map("t", "<C-i>", "<C-\\><C-N>", { desc = "terminal | exit mode" })

-- Save and quit
map("n", "Q", cmder("q"), { desc = "file | quit" })
map({ "n", "i" }, "<C-s>", cmder("w"), { desc = "file | save" })

-- Key conflict fixes
map({ "i", "t" }, "<tab>", "<tab>", { desc = "global | fix tab & <ctrl>+i " })
map("n", "<enter>", "<enter>", { desc = "global | fix enter & <ctrl>+m" })
map({ "v", "s" }, "<Esc>", "<Esc>", { desc = "global |fix Esc & <ctrl>+[" })

-- Number manipulation
map("n", "+", "<C-a>", { desc = "number | increment" })
map("n", "-", "<C-x>", { desc = "number | decrement" })

-- Indentation
map("v", "<", "<gv", { desc = "indent | left" })
map("v", ">", ">gv", { desc = "indent | right" })

-- Formatting
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "file | format" })

-- Buffer operations
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer | close" })
map("n", "<C-o>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer | next" })
map("n", "<C-i>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer | previous" })

-- File explorer
map("n", "<C-n>", cmder("NvimTreeToggle"), { desc = "nvimtree | toggle" })

-- Telescope mappings
map("n", "<leader>fw", cmder("Telescope live_grep"), { desc = "telescope | live grep" })
map("n", "<leader>fb", cmder("Telescope buffers"), { desc = "telescope | find buffers" })
map("n", "<leader>fh", cmder("Telescope help_tags"), { desc = "telescope | help tags" })
map("n", "<leader>ma", cmder("Telescope marks"), { desc = "telescope | marks" })
map("n", "<leader>fo", cmder("Telescope oldfiles"), { desc = "telescope | recent files" })
map("n", "<leader>fz", cmder("Telescope current_buffer_fuzzy_find"), { desc = "telescope | fuzzy find in buffer" })
map("n", "<leader>cm", cmder("Telescope git_commits"), { desc = "telescope | git commits" })
map("n", "<leader>gs", cmder("Telescope git_status"), { desc = "telescope | git status" })
map("n", "<leader>pt", cmder("Telescope terms"), { desc = "telescope | terminal picker" })
map("n", "<leader>ff", cmder("Telescope find_files"), { desc = "telescope | find files" })
map("n", "<leader>fk", cmder("Telescope keymaps"), { desc = "telescope | keymaps" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope | find all files" }
)
map("n", "<leader>fc", cmder("TodoTelescope"), { desc = "telescope | todo comments" })

-- Select Theme
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "nvchad | themes" })

-- Terminal controls
map("n", "<leader>h", function()
  require("nvchad.term").new({ pos = "sp" })
end, { desc = "terminal | new horizontal" })
map("n", "<leader>v", function()
  require("nvchad.term").new({ pos = "vsp" })
end, { desc = "terminal | new vertical" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal | toggle floating" })

-- Tabs
map("n", "<tab>", cmder("tabnext"), { desc = "tab | next" })
map("n", "<S-tab>", cmder("tabprev"), { desc = "tab | previous" })

-- Plugins
map("n", "<leader>lu", cmder("Lazy"), { desc = "lazy | UI" })

-- Code runner
map("n", "<leader>cp", require("code_runner").run, { desc = "code | run" })

-- Database
map("n", "<leader>do", cmder("DBUIToggle"), { desc = "db | toggle UI" })

-- Debugging
map("n", "<leader>db", cmder("DapToggleBreakpoint"), { desc = "dap | toggle breakpoint" })
map("n", "<leader>dc", cmder("DapContinue"), { desc = "dap | continue" })
map("n", "<leader>dt", cmder("lua require('dapui').toggle()"), { desc = "dap | toggle UI" })
map("n", "<leader>dr", cmder("lua require('dapui').open({reset=true})"), { desc = "dap | redraw UI" })

-- Diagnostics and tools
map("n", "<leader>e", cmder("Trouble diagnostics toggle focus=true"), { desc = "diagnostics | toggle trouble" })
map("n", "<leader>mt", function()
  require("render-markdown").toggle()
end, { desc = "markdown | toggle render" })
map("n", "<leader>o", cmder("Outline"), { desc = "outline | toggle" })
map("n", "<leader>sr", cmder("GrugFar"), { desc = "search | replace (GrugFar)" })
