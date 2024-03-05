-- Relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode, shhh don't tell anyone
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Min number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4

-- Number of spaces that a <Tab> counts for while performing editing
-- operations, like inserting a <Tab> or using <BS>
vim.opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4

-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- This option changes how text is displayed.  It doesn't change the text in the buffer
vim.opt.wrap = false

-- When there is a previous search pattern, highlight all its matches
vim.opt.hlsearch = false

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- https://neovim.io/doc/user/options.html#'isfname'
vim.opt.isfname:append("@-@")
