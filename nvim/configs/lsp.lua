vim.diagnostic.config({
	virtual_lines = true, virtual_text = false, underline = true, signs = true, severity_sort = true, update_in_insert = false, })

-- Python
vim.lsp.config("python", {
	cmd = { "pyright", "--stdio" },
	filetypes = { "py" },
})
vim.lsp.enable("python")

-- Javascript
vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})
vim.lsp.enable("ts_ls")

-- C/C++
vim.lsp.config("clangd", {
	cmd = { "clangd" },
	filetypes = { "cpp", "c", "h", "hpp" },
})
vim.lsp.enable("clangd")

-- HTML
vim.lsp.config("html", {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "htm" },
})
vim.lsp.enable("html")

-- CSS
vim.lsp.config("cssls", {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css" },
})
vim.lsp.enable("cssls")

-- Lua
vim.lsp.config("lua", {
	cmd = { "lua-language-server", "--stdio" },
	filetypes = { "lua" },
})
vim.lsp.enable("lua")
