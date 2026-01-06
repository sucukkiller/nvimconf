return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "codelldb" },
				automatic_installation = true,
			})

			-- 1. CONFIGURATION DE L'ADAPTATEUR CODELLDB (Ajouté pour corriger l'erreur)
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- On pointe vers le binaire installé par Mason
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					args = { "--port", "${port}" },
				},
			}

			-- Setup de l'UI
			dapui.setup()

			-- Ouverture/Fermeture automatique de l'interface
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			--			dap.listeners.before.event_terminated["dapui_config"] = function()
			--				dapui.close()
			--			end
			--			dap.listeners.before.event_exited["dapui_config"] = function()
			--				dapui.close()
			--  		end

			--------------------------
			-- Configuration PYTHON --
			--------------------------
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)

			-----------------------
			-- Configuration C++ --
			-----------------------
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb", -- Ce nom doit correspondre à la clé dans dap.adapters
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp

			-------------------
			-- Raccourcis    --
			-------------------
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)
			vim.keymap.set("n", "<leader>b", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
}
