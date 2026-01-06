return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Affiche les fichiers cachés par défaut
					hide_dotfiles = false,
					hide_gitignored = false, -- Optionnel : affiche aussi les fichiers dans .gitignore
				},
				follow_current_file = {
					enabled = true, -- L'arbre suit le fichier que tu as ouvert
				},
			},
			window = {
				width = 30,
			},
		})

		-- Keymap pour toggle (ouvrir/fermer)
		-- On ajoute "reveal" pour que Neo-tree se focalise sur le fichier actuel à l'ouverture
		vim.keymap.set("n", "<C-n>", ":Neotree toggle reveal<CR>", { silent = true })
	end,
}
