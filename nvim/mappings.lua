require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>tt", "<cmd> Telescope<CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>m", "<cmd> Telescope lsp_document_symbols ignore_symbols=variable <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>fm", "<cmd> lua require('conform').format() <CR>", { desc = "Format file with Formatter" })
map("n", "<leader>fmm", "<cmd> FormatWriteLock <CR>", { desc = "Format file with Formatter and Save" })
map("n", "{", "<C-O>")
map("n", "}", "<C-I>")
map("n", "(", "[m")
map("n", ")", "]m")

map('v', '<A-S-k>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
map('v', '<A-S-j>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})

map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

map("n", "<M-p>", "<cmd> CopilotChatToggle <CR>")
map("v", "<M-p>", "<cmd> CopilotChatToggle <CR>")
map("v", "<leader>ee", "<cmd> CopilotChatExplain <CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
