-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

vim.lsp.enable("ts_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("pyright")
vim.lsp.enable("gdscript")

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
	underline = true,
	signs = true,
	severity_sort = true,
	update_in_insert = false,
})

local function on_list(options)
  vim.fn.setqflist({}, " ", options)
	-- vim.cmd.cfirst()
	require("trouble").open({ mode = "quickfix" })
end

-- vim.lsp.buf.definition({ on_list = on_list })
function LspReferences()
	vim.lsp.buf.references(nil, { on_list = on_list })
end


vim.keymap.set("n", "grr", "<cmd> lua LspReferences() <CR>", { noremap = true, silent = true })
