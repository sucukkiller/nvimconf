return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Fonction pour récupérer le nom du serveur LSP actif
		local function lsp_name()
			local msg = "No Active LSP"
			local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end

		require("lualine").setup({
			options = {
				theme = "auto", -- S'adapte automatiquement à ton colorscheme
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "alpha", "dashboard", "NvimTree" },
				},
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", file_status = true, path = 1 } },
				lualine_x = {
					-- Affiche le serveur LSP actif (ex: pyright, clangd, null-ls)
					{ lsp_name, icon = " ", color = { fg = "#ffffff", gui = "bold" } },
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
