-- ========================================================================== --
--                             UI/Appearance                              --
-- ========================================================================== --

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.numberwidth = 4 -- Set number column width
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.cursorline = false -- Highlight the current line
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.showtabline = 1 -- Always show tabs
vim.opt.pumheight = 10 -- Pop up menu height
vim.opt.conceallevel = 0 -- So that `` is visible in markdown files
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.splitbelow = true -- Force all horizontal splits to go below current window
vim.opt.splitright = true -- Force all vertical splits to go to the right of current window
vim.opt.wrap = false -- Display lines as one long line
vim.opt.linebreak = true -- Companion to wrap, don't split words
vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.fillchars = { eob = " " } -- Remove the `~` from the end of the buffer

-- ========================================================================== --
--                           Editing Behavior                             --
-- ========================================================================== --

vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.clipboard = "unnamedplus" -- Sync clipboard with OS
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.backup = false -- Don't create a backup file
vim.opt.writebackup = false -- Don't create a backup file
vim.opt.swapfile = false -- Don't create a swap file
vim.opt.autoindent = true -- Copy indent from current line when starting new one
vim.opt.smartindent = true -- Make indenting smarter
vim.opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start
vim.opt.whichwrap = "bs<>[]hl" -- which "horizontal" keys are allowed to travel to prev/next line
vim.opt.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.shortmess:append("c") -- Don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically

-- ========================================================================== --
--                          Tabs and Indentation                            --
-- ========================================================================== --

vim.opt.tabstop = 2 -- Insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- The number of spaces inserted for each indentation
vim.opt.softtabstop = 2 -- Number of spaces that a tab counts for while performing editing operations
vim.opt.expandtab = true -- Convert tabs to spaces

-- ========================================================================== --
--                                 Search                                   --
-- ========================================================================== --

vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- Smart case searching

-- ========================================================================== --
--                                Varia                                     --
-- ========================================================================== --

vim.opt.fileencoding = "utf-8" -- The encoding written to a file
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate vim plugins from neovim
