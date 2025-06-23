local g = vim.g
local o = vim.o
local opt = vim.opt

-- Basic UI settings
o.number = true -- Absolute line numbers
opt.relativenumber = true -- Relative line numbers
o.mouse = "a" -- Enable mouse support in all modes
o.cursorline = true -- Highlight the current line
o.cursorlineopt = "number" -- Only highlight the line number (not full line)
opt.termguicolors = true -- Enable true color support

-- Indentation settings
o.tabstop = 2 -- Visual width of a tab
o.shiftwidth = 2 -- Number of spaces for each indentation level
o.expandtab = true -- Use spaces instead of tabs
o.smartindent = true -- Enable smart indentation
o.autoindent = true -- Copy indentation from the previous line
o.softtabstop = 2

-- Wrapping and scrolling
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 10 -- Keep 10 lines visible above/below the cursor

-- Search settings
o.ignorecase = true -- Ignore case in searches
o.smartcase = true -- Make search case-sensitive if uppercase is used
opt.incsearch = true -- Show search results incrementally
opt.hlsearch = true -- Highlight all search matches

-- UI enhancements
o.signcolumn = "yes" -- Always show the sign column
opt.fillchars = { eob = " " } -- Remove '~' in empty buffer lines

-- Backup and swap settings
opt.swapfile = false -- Disable swap file creation
opt.backup = false -- Disable backup file creation
o.undofile = true -- Enable persistent undo

-- Statusline and command area
o.laststatus = 3 -- Always show the statusline
o.showmode = false -- Hide the mode (e.g., -- INSERT --)
o.numberwidth = 2 -- Set the number column width
opt.cmdheight = 1 -- Set the height of the command line
opt.ruler = false -- Hide the ruler in the statusline
opt.shortmess:append("sI") -- Suppress intro screen and some messages

-- Timeouts and update interval
o.timeoutlen = 400 -- Time to wait for mapped sequence to complete
o.updatetime = 250 -- Time before writing swap file (also for gitsigns)
opt.whichwrap:append("<>[]hl") -- Allow wrapping with h/l/arrow keys

-- Misc settings
opt.hidden = true -- Allow hidden buffers
opt.errorbells = false -- Disable error bells
opt.backspace = "indent,eol,start" -- Configure backspace behavior
opt.modifiable = true -- Make buffers modifiable
o.clipboard = "unnamedplus"
o.ruler = false
o.splitbelow = true
o.splitright = true

-- Disable unnecessary providers
g.loaded_node_provider = 0 -- Disable Node.js provider
g.loaded_python3_provider = 0 -- Disable Python3 provider
g.loaded_perl_provider = 0 -- Disable Perl provider
g.loaded_ruby_provider = 0 -- Disable Ruby provider

-- Code Folding
o.foldenable = false
o.foldlevelstart = 99

-- Add mason binaries to PATH (for LSP and other tools)
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
