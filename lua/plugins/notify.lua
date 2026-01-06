return {
	-- Le moteur de notifications
	{
		"rcarriga/nvim-notify",
		opts = {
			-- On remet à 3000ms (3 secondes)
			timeout = 3000,

			-- On augmente la largeur pour éviter que le texte soit coupé
			max_width = 50,

			-- Le rendu "default" est plus complet que "minimal"
			render = "default",

			-- "fancy" permet d'avoir les animations fluides de glissement
			stages = "fade_in_slide_out",

			-- On s'assure que les icônes sont bien là
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		},
	},
	-- L'interface UI (Noice)
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- override nvim-lspconfig pour que les messages LSP s'affichent en notif
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.set_autocmds"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			-- Pour que les messages (ex: "5 lines yanked") deviennent des notifications
			presets = {
				bottom_search = true, -- barre de recherche en bas
				command_palette = true, -- commande au centre (style launcher)
				long_message_to_split = true, -- messages longs dans un split
				inc_rename = false, -- active si tu as inc-rename.nvim
				lsp_doc_border = false, -- bordure pour la doc LSP
			},
		},
		config = function(_, opts)
			require("noice").setup(opts)
		end,
	},
}
