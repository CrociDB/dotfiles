require("nvchad.options")

vim.cmd([[
  au BufRead,BufNewFile *.mpp set filetype=cpp
]])

vim.filetype.add({
  extension = {
    ino = "c",
    vert = "glsl",
    frag = "glsl",
  },
})

if vim.g.nvim_mode == "org" then
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
      vim.opt_local.conceallevel = 2
    end,
  })
end

vim.notify = require("notify")

require("cmp").setup({ enabled = false })

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
