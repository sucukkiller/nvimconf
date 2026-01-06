return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 1. Ton ASCII Art personnalisé
		dashboard.section.header.val = {
			[[                                                       ]],
			[[               ████ ██████           █████      ██]],
			[[              ███████████             █████       ]],
			[[              █████████ ███████████████████ ███   ███████████]],
			[[             █████████  ███    █████████████ █████ ██████████████]],
			[[            █████████ ██████████ █████████ █████ █████ ████ █████]],
			[[          ███████████ ███    ███ █████████ █████ █████ ████ █████]],
			[[         ██████  █████████████████████ ████ █████ █████ ████ ██████]],
		}

		vim.api.nvim_set_hl(0, "BlancPur", { fg = "#FFFFFF" })

		-- Applique-la au header
		dashboard.section.footer.opts.hl = "BlancPur"
		dashboard.section.header.opts.hl = "BlancPur"

		-- 2. Configuration des boutons (Options)
		dashboard.section.buttons.val = {
			dashboard.button("n", "  Nouveau fichier", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  Trouver un fichier", ":Telescope find_files <CR>"),
			dashboard.button("r", "󰄉  Fichiers récents", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "󱂬  Dernière session", [[<cmd>lua require("persistence").load()<cr>]]),
			dashboard.button("p", "󰏘  Changer de Thème", "<cmd>Telescope colorscheme enable_preview=true<CR>"),
			dashboard.button("h", "  Keymaps", [[<cmd>lua require("which-key").show({ global = false })<cr>]]),
			dashboard.button("s", "󱘲  Paramètres", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "󰅚  Quitter", ":qa<CR>"),
		}

		-- 3. Mise en page pour mettre les options à côté (ou en dessous de manière aérée)
		-- Note : Le thème Dashboard standard aligne tout au centre.
		dashboard.config.layout = {
			{ type = "padding", val = 4 },
			dashboard.section.header,
			{ type = "padding", val = 4 }, -- Espace entre l'art et les boutons
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
			dashboard.section.footer,
		}
		-- Désactive le scroll et cache le curseur sur l'écran Alpha
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.cmd("setlocal nobuflisted")
				-- Empêche le défilement avec la souris ou les touches
				vim.opt_local.scrolloff = 999
				-- Optionnel : si tu veux bloquer les mouvements de touche directionnelle
				-- pour rester uniquement sur les boutons
			end,
		})

		alpha.setup(dashboard.opts)
	end,
}
