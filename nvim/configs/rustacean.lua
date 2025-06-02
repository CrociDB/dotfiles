vim.g.rustaceanvim = {
	tools = {},
	server = {
		on_attach = function(client, bufnr)
			local map = vim.keymap.set
			map("n", "<leader>dr", "<cmd> RustLsp debuggables<CR>", { noremap = true, silent = true })
			map("n", "<leader>ca", "<cmd> RustLsp codeAction<CR>", { noremap = true, buffer = bufnr })
			map("n", "K", "<cmd> RustLsp hover actions<CR>", { noremap = true, silent = true, buffer = bufnr })
		end,
		default_settings = {
			["rust-analyzer"] = {},
		},
	},
	dap = {},
}
