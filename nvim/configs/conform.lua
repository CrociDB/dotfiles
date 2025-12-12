local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		haskell = { "fourmolu" },
		zig = { "zigfmt" },
		ocaml = { "ocamlformat" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		ino = { "clang-format" },
		gdscript = { "gdformat" },
		rust = { "rustfmt", lsp_format = "fallback" },
		toml = { "pyproject-fmt" },
		python = { "isort", "black" },
	},

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

return options
