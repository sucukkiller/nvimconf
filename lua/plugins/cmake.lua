return {
	"Civitasv/cmake-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- La configuration par défaut est généralement suffisante pour commencer
		cmake_build_directory = "build",
		cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
	},
}
