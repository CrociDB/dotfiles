---@type ChadrcConfig
local M = {}

-- Keymaps
local map = vim.keymap.set
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>m", "<cmd> Telescope lsp_document_symbols ignore_symbols=variable <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>fm", "<cmd> FormatLock <CR>", { desc = "Format file with Formatter" })
map("n", "<leader>fmm", "<cmd> FormatWriteLock <CR>", { desc = "Format file with Formatter and Save" })
map("n", "{", "<C-O>")
map("n", "}", "<C-I>")
map("n", "(", "[m")
map("n", ")", "]m")

map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

map("n", "<M-p>", "<cmd> CopilotChatToggle <CR>")
map("v", "<M-p>", "<cmd> CopilotChatToggle <CR>")
map("v", "<leader>ee", "<cmd> CopilotChatExplain <CR>")

vim.opt.relativenumber = true

-- NVChad options
M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"

return M
