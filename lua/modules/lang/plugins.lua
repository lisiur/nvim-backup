local lang = {}
local conf = require("modules.lang.config")

lang["simrat39/rust-tools.nvim"] = {
	opt = true,
	ft = "rust",
	config = conf.rust_tools,
	requires = { { "nvim-lua/plenary.nvim", opt = false } },
}

lang["akinsho/flutter-tools.nvim"] = {
	opt = true,
	ft = "dart",
	config = conf.flutter_tools,
	requires = { { "nvim-lua/plenary.nvim", opt = false } },
}

return lang
