return {
	"pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			enabled = true, -- active le plugin au démarrage

			-- Déclencheurs de sauvegarde
			execution_message = {
				message = function()
					return ("AutoSave: sauvegardé à " .. vim.fn.strftime("%H:%M:%S"))
				end,
				dim = 0.18, -- Opacité du message
				cleaning_interval = 1250, -- Temps avant que le message disparaisse
			},

			-- C'est ici qu'on définit le comportement "à la VS Code"
			events = { "InsertLeave", "TextChanged" },

			-- Conditions pour sauvegarder
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				-- Ne pas sauvegarder si le fichier est dans un mode spécial (ex: terminal)
				if utils.not_in(fn.getbufvar(buf, "&filetype"), { "neo-tree", "TelescopePrompt", "harpoon" }) then
					return true
				end
				return false
			end,

			write_delay = 1000, -- Sauvegarde après 1 seconde d'inactivité (comme le "delay" de VS Code)
			debounce_delay = 135, -- Évite trop de sauvegardes lors d'une frappe rapide
		})
	end,
}
