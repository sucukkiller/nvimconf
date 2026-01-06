-- ========================================================================== --
--                               General                                  --
-- ========================================================================== --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local modes = { "n", "i", "v" }

-- Disable default space action
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- In Normal mode: map backspace to delete previous character like a normal editor
vim.keymap.set("n", "<BS>", "i<BS><Esc>", opts)

-- In Visual mode: delete selection without yanking
vim.keymap.set("v", "<BS>", '"_d', opts)

-- Clear search highlighting
vim.keymap.set("n", "<leader>n", ":noh<CR>", { desc = "Clear search highlight" })

-- Open Alpha menu
vim.keymap.set("n", "<leader>m", "<cmd>Alpha<CR>", { desc = "Open Alpha menu" })




-- ========================================================================== --
--                           Clipboard & Editing                            --
-- ========================================================================== --

-- Copy to clipboard in Visual mode
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

-- Paste from clipboard in Normal, Visual and Insert modes
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard" })

-- Select all
vim.keymap.set(modes, "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Save
vim.keymap.set(modes, "<C-s>", "<cmd>update<CR><Esc>", { desc = "Save" })

-- Quit
vim.keymap.set(modes, "<C-q>", ":Neotree close<CR>:wqa!<CR>", { desc = "Close Neo-tree and quit Neovim" })

-- Undo/Redo
vim.keymap.set(modes, "<C-z>", "<cmd>undo<CR>", { desc = "Undo" })
vim.keymap.set(modes, "<C-y>", "<cmd>redo<CR>", { desc = "Redo" })

-- ========================================================================== --
--                               Line Moving                                --
-- ========================================================================== --

vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- ========================================================================== --
--                      Window & Terminal Navigation                        --
-- ========================================================================== --

vim.keymap.set(modes, "<C-h>", "<C-w>h", { desc = "Navigate to the left window" })
vim.keymap.set(modes, "<C-j>", "<C-w>j", { desc = "Navigate to the window below" })
vim.keymap.set(modes, "<C-k>", "<C-w>k", { desc = "Navigate to the window above" })
vim.keymap.set(modes, "<C-l>", "<C-w>l", { desc = "Navigate to the right window" })

-- Floating Terminal (Snacks)
vim.keymap.set({ "n", "t" }, "<leader>t", function()
	if vim.fn.mode() == "i" then
		vim.cmd("stopinsert")
	end
	Snacks.terminal.toggle()
end, { desc = "Toggle floating terminal" })

-- ========================================================================== --
--                           C++ Compilation (F5)                             --
-- ========================================================================== --

local function compile_and_run_cpp()
	vim.cmd("silent! write")
	vim.notify("Compiling and running C++ file...", vim.log.levels.INFO)
	local file = vim.fn.expand("%:p")
	local output = vim.fn.expand("%:p:r")
	local cmd = string.format("clang++ -g -Wall -std=c++17 '%s' -o '%s' && '%s'", file, output, output)
	vim.cmd("botright split | term " .. cmd)
	vim.cmd("startinsert")
end

vim.keymap.set(modes, "<F5>", compile_and_run_cpp, { desc = "C++: Compile & Run" })
