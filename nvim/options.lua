require "nvchad.options"

vim.cmd [[
  au BufRead,BufNewFile *.mpp set filetype=cpp
]]

vim.opt.relativenumber = true


-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
