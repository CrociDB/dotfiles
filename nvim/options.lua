require("nvchad.options")

vim.cmd([[
  au BufRead,BufNewFile *.mpp set filetype=cpp
]])

vim.filetype.add({
	extension = {
		ino = "c",
	},
})

vim.diagnostic.config({
  virtual_text = false,
	virtual_lines = true,
	underline = true, -- Keep underlines for diagnostics
	signs = true, -- Keep signs in the sign column
	severity_sort = true, -- Sort diagnostics by severity
	update_in_insert = false, -- Optionally, don't update diagnostics in insert mode
})

vim.opt.relativenumber = true

require("cmp").setup({ enabled = false })

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
