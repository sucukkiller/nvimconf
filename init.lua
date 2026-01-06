require("core.config")
require("core.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Add autocmd to save theme on ColorScheme event
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        require("utils.theme_saver").save_current_theme()
    end,
})

-- Autocmd to apply theme on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        require("utils.theme_saver").apply_saved_theme()
    end,
})
