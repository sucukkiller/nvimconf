return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Configuration optionnelle
		preset = "modern", -- Style moderne (disponible dans les dernières versions)
		delay = 300, -- Temps d'attente avant l'apparition (en ms)
		win = {
			border = "rounded", -- Bordures arrondies pour l'UI
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Afficher tous les keymaps",
		},
	},
}
