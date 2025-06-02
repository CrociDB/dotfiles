require("nvchad.options")

vim.cmd([[
  au BufRead,BufNewFile *.mpp set filetype=cpp
]])

vim.filetype.add({
	extension = {
		ino = "c",
	},
})

vim.opt.relativenumber = true

require("cmp").setup({ enabled = false })

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
