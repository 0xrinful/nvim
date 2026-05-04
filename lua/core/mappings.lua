local map = vim.keymap.set

-- Helper for cleaner command strings
local function cmd(str)
  return "<cmd>" .. str .. "<CR>"
end

-- -------------------------------------------------------------------------
-- NAVIGATION & WINDOWS
-- -------------------------------------------------------------------------
-- Insert mode movement (mimics arrow keys)
map("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
map("i", "<C-l>", "<Right>", { desc = "Move cursor right" })
map("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
map("i", "<C-k>", "<Up>", { desc = "Move cursor up" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch to top window" })

-- Resizing panes
map("n", "<Up>", cmd("resize +2"), { desc = "Increase window height" })
map("n", "<Down>", cmd("resize -2"), { desc = "Decrease window height" })
map("n", "<Left>", cmd("vertical resize -2"), { desc = "Decrease window width" })
map("n", "<Right>", cmd("vertical resize +2"), { desc = "Increase window width" })

-- -------------------------------------------------------------------------
-- BUFFERS & FILES
-- -------------------------------------------------------------------------
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer: Close" })
map("n", "<C-o>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer: Next" })
map("n", "<C-i>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer: Previous" })

map("n", "<tab>", cmd("tabnext"), { desc = "Tab: Next" })
map("n", "<S-tab>", cmd("tabprev"), { desc = "Tab: Previous" })

map("n", "Q", cmd("q"), { desc = "Quit window" })
map({ "n", "i" }, "<C-s>", cmd("w"), { desc = "Save file" })

-- -------------------------------------------------------------------------
-- TELESCOPE (Search & Find)
-- -------------------------------------------------------------------------
map("n", "<leader>ff", cmd("Telescope find_files"), { desc = "Find files" })
map("n", "<leader>fa", cmd("Telescope find_files follow=true no_ignore=true hidden=true"), { desc = "Find all files" })
map("n", "<leader>fw", cmd("Telescope live_grep"), { desc = "Live grep (search text)" })
map("n", "<leader>fo", cmd("Telescope oldfiles"), { desc = "Recent files" })
map("n", "<leader>fb", cmd("Telescope buffers"), { desc = "Find buffers" })
map("n", "<leader>fz", cmd("Telescope current_buffer_fuzzy_find"), { desc = "Fuzzy find in buffer" })
map("n", "<leader>fh", cmd("Telescope help_tags"), { desc = "Help tags" })
map("n", "<leader>fk", cmd("Telescope keymaps"), { desc = "Search keymaps" })
map("n", "<leader>ma", cmd("Telescope marks"), { desc = "Search marks" })
map("n", "<leader>fc", cmd("TodoTelescope"), { desc = "Find TODOs" })
map("n", "<leader>cm", cmd("Telescope git_commits"), { desc = "Git commits" })
map("n", "<leader>gs", cmd("Telescope git_status"), { desc = "Git status" })
map("n", "<leader>pt", cmd("Telescope terms"), { desc = "Terminal picker" })

-- -------------------------------------------------------------------------
-- CODING & TOOLS
-- -------------------------------------------------------------------------
-- Formatting
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format code" })

-- Commenting (respects remap for internal gc/gcc)
map("n", "<C-/>", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<C-/>", "gc", { desc = "Toggle selection comment", remap = true })

-- Code Runner & DB
map("n", "<leader>cp", function()
  require("core.code_runner").run()
end, { desc = "Code: Run project" })
map("n", "<leader>do", cmd("DBUIToggle"), { desc = "Database: Toggle UI" })

-- UI Tools
map("n", "<C-n>", cmd("NvimTreeToggle"), { desc = "Explorer: Toggle tree" })
map("n", "<leader>o", cmd("Outline"), { desc = "Outline: Toggle sidebar" })
map("n", "<leader>e", cmd("Trouble diagnostics toggle focus=true"), { desc = "Trouble: Diagnostics" })
map("n", "<leader>sr", cmd("GrugFar"), { desc = "Search & Replace (Grug)" })
map("n", "<leader>mt", function()
  require("render-markdown").toggle()
end, { desc = "Markdown: Toggle render" })
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "Themes: Select" })
map("n", "<leader>lu", cmd("Lazy"), { desc = "Lazy: Update/UI" })

-- -------------------------------------------------------------------------
-- DEBUGGING (DAP)
-- -------------------------------------------------------------------------
map("n", "<leader>db", cmd("DapToggleBreakpoint"), { desc = "Debug: Toggle breakpoint" })
map("n", "<leader>dc", cmd("DapContinue"), { desc = "Debug: Continue/Start" })
map("n", "<leader>dt", cmd("lua require('dapui').toggle()"), { desc = "Debug: Toggle UI" })
map("n", "<leader>dr", cmd("lua require('dapui').open({reset=true})"), { desc = "Debug: Reset UI" })

-- -------------------------------------------------------------------------
-- TERMINAL
-- -------------------------------------------------------------------------
map("n", "<leader>h", function()
  require("nvchad.term").new({ pos = "sp" })
end, { desc = "Terminal: New horizontal" })
map("n", "<leader>v", function()
  require("nvchad.term").new({ pos = "vsp" })
end, { desc = "Terminal: New vertical" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal: Toggle floating" })

-- -------------------------------------------------------------------------
-- VIM FIXES & UTILS
-- -------------------------------------------------------------------------
map("n", "<Esc>", cmd("noh"), { desc = "Clear search highlights" })
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Mode Exits & Terminal Fixes
map("i", "<C-i>", "<ESC>", { desc = "blink.cmp: " })
map("t", "<C-i>", "<C-\\><C-N>", { desc = "Terminal: Exit to Normal" })
map({ "i", "t" }, "<tab>", "<tab>", { desc = "Fix Tab/C-i conflict" })
map("n", "<enter>", "<enter>", { desc = "Fix Enter/C-m conflict" })
map({ "v", "s" }, "<Esc>", "<Esc>", { desc = "Fix Esc/C-[ conflict" })
