---@type ChadrcConfig
local M = {}

-- Keymaps
local map = vim.keymap.set
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope Document Symbols" })

-- NVChad options
M.ui = { theme = 'vscode_dark' }
M.plugins = "custom.plugins"

return M
