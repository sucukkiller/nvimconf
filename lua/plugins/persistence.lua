return {
	"folke/persistence.nvim",
	event = "VimEnter", -- Load the plugin on startup
	opts = {
		dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory to save sessions
		options = { "buffers", "curdir", "tabpages", "winsize", "globals" }, -- what to save in the session
	},
}
