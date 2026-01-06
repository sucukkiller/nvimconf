return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers", -- "tabs" ou "buffers"
				numbers = "buffer_id", -- Peut être "none" | "ordinal" | "buffer_id"
				close_command = "bdelete! %d", -- Commande pour fermer un buffer
				right_mouse_command = "bdelete! %d", -- Clic droit pour fermer
				always_show_bufferline = true, -- Toujours afficher, même avec un seul buffer
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				separator_style = "thin", -- "thin", "slant", "thick"
				diagnostics = "nvim_lsp", -- "nvim_lsp", "coc", false
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		local opts = { noremap = true, silent = true }
		local modes = { "n", "i", "v" }

		-- --- NAVIGATION TYPE NAVIGATEUR ---

		-- Suivant/Précédent : Tab / Shift-Tab
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)

		-- Aller à un onglet spécifique (Alt + Chiffre)
		vim.keymap.set(modes, "<A-&>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
		vim.keymap.set(modes, "<A-é>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
		vim.keymap.set(modes, '<A-">', "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
		vim.keymap.set(modes, "<A-'>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
		vim.keymap.set(modes, "<A-(>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
		vim.keymap.set(modes, "<A-->", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
		vim.keymap.set(modes, "<A-è>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
		vim.keymap.set(modes, "<A-_>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
		vim.keymap.set(modes, "<A-ç>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
		vim.keymap.set(modes, "<A-à>", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)

		-- Déplacer les onglets : Alt + Flèches
		vim.keymap.set("n", "<A-Left>", "<Cmd>BufferLineMovePrev<CR>", opts)
		vim.keymap.set("n", "<A-Right>", "<Cmd>BufferLineMoveNext<CR>", opts)

		-- FERMER : Alt + W avec retour à l'écran d'accueil
		vim.keymap.set(modes, "<A-w>", function()
			local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
			if #listed_buffers <= 1 then
				vim.cmd("bdelete!")
				vim.cmd("Alpha") -- Ou l'écran d'accueil que tu utilises
			else
				vim.cmd("bdelete!")
			end
		end, { desc = "Fermer l'onglet et Accueil si dernier" })
	end,
}
