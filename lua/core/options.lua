local g = vim.g
local opt = vim.opt

-------------------------------------------------------------------------------
-- UI Settings
-------------------------------------------------------------------------------
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers (easier jumping)
opt.cursorline = true -- Highlight the line where the cursor is
opt.cursorlineopt = "number" -- Only highlight the number column, not the text line
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.mouse = "a" -- Allow mouse usage in all modes
opt.signcolumn = "yes" -- Always show the sign column (prevents text shift)
opt.fillchars = { eob = " " } -- Hide the '~' characters after the end of the file
opt.numberwidth = 2 -- Minimum width of the number column
opt.laststatus = 3 -- Use a single global statusline across all windows
opt.showmode = false -- Hide mode (INSERT/VISUAL) as statusline usually shows it

-------------------------------------------------------------------------------
-- Editor Behavior & Indentation
-------------------------------------------------------------------------------
opt.tabstop = 2 -- Number of spaces a <Tab> counts for
opt.shiftwidth = 2 -- Number of spaces for each auto-indent step
opt.softtabstop = 2 -- Number of spaces for a <Tab> while editing
opt.expandtab = true -- Convert tabs to spaces
opt.smartindent = true -- Make indenting smart (e.g., after brackets)
opt.autoindent = true -- Copy indent from the previous line
opt.wrap = false -- Don't wrap long lines
opt.scrolloff = 10 -- Keep 10 lines visible above/below the cursor
opt.sidescrolloff = 10 -- Keep 10 columns visible left/right of cursor
opt.backspace = "indent,eol,start" -- Allow backspacing over everything
opt.modifiable = true -- Ensure buffers can be edited

-------------------------------------------------------------------------------
-- Search
-------------------------------------------------------------------------------
opt.ignorecase = true -- Case-insensitive search...
opt.smartcase = true -- ...unless the search query contains uppercase
opt.incsearch = true -- Show search results as you type
opt.hlsearch = true -- Keep search results highlighted

-------------------------------------------------------------------------------
-- Performance & Filesystem
-------------------------------------------------------------------------------
opt.swapfile = false -- Don't use swap files
opt.backup = false -- Don't create backup files
opt.undofile = true -- Save undo history to a file (persistent undo)
opt.timeoutlen = 400 -- Time to wait for a mapped sequence (ms)
opt.updatetime = 250 -- Faster refresh for plugins (e.g., Gitsigns)
opt.hidden = true -- Allow switching buffers without saving
opt.errorbells = false -- Disable annoying beep sounds

-------------------------------------------------------------------------------
-- Layout & Interaction
-------------------------------------------------------------------------------
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open to the right
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.virtualedit = "block" -- Allow cursor to move into empty space in Visual Block
opt.whichwrap:append("<>[]hl") -- Allow arrow keys and h/l to move to next/prev line
opt.shortmess:append("sI") -- Suppress intro screen and other messages
opt.cmdheight = 1 -- Space for command line messages
opt.ruler = false -- Hide the default ruler (handled by statusline)

-------------------------------------------------------------------------------
-- Folding
-------------------------------------------------------------------------------
opt.foldenable = false -- Disable folding by default
opt.foldlevelstart = 99 -- Ensure all folds are open if folding is toggled on

-------------------------------------------------------------------------------
-- Disable Unnecessary Providers (Speeds up startup)
-------------------------------------------------------------------------------
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-------------------------------------------------------------------------------
-- System Path Management
-------------------------------------------------------------------------------
-- Add Mason binaries to the system PATH so Neovim can find LSPs/Formatters
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
