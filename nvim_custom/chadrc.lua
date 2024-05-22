---@type ChadrcConfig
local M = {}

-- Keymaps
local map = vim.keymap.set
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>m", "<cmd> Telescope lsp_document_symbols ignore_symbols=variable <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>fm", "<cmd> FormatLock <CR>", { desc = "Format file with Formatter" })
map("n", "<leader>fmm", "<cmd> FormatWriteLock <CR>", { desc = "Format file with Formatter and Save" })

-- NVChad options
M.ui = { theme = 'vscode_dark' }
M.plugins = "custom.plugins"

return M
