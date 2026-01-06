return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			sections = {
				{
					section = "terminal",
					-- COMMANDE POUR L'IMAGE :
					-- On utilise l'utilitaire 'cat' pour envoyer l'image au terminal
					-- Snacks s'occupe de la convertir au bon format selon ton terminal
					height = 25,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
