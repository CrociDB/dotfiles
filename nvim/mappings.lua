require("nvchad.mappings")

-- Some auxiliary functions
function CopilotChatActions()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions(), { previewer = false })
end

function CopilotChatQuickPrompt()
	local prompt = vim.fn.input("Ask Copilot: ")
	if prompt ~= "" then
		local chat = require("CopilotChat")
		chat.ask(prompt, {
			selection = function(source)
				local select = require("CopilotChat.select")
				return select.visual(source) or select.buffer(source)
			end,
			context = { "buffers", "files" },
			callback = function(response)
				print("Response:", response)
			end,
		})
	end
end

-- Maps

vim.api.nvim_del_keymap('n', "<leader>fz")

local map = vim.keymap.set

-- Telescope
map("n", "<leader>fz", "<cmd> Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>tt", "<cmd> Telescope<CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope Document Symbols" })
map("n", "<leader>dd", "<cmd> Telescope diagnostics <CR>", { desc = "Telescope Document Symbols" })
map(
  "n",
  "<leader>m",
  "<cmd> Telescope lsp_document_symbols symbols=function,method <CR>",
  { desc = "Telescope Document Symbols" }
)

-- Motions
map("v", "//", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], { noremap = true, silent = true })
map("n", "//", [[:let @/='\V' . escape(expand('<cword>'), '/\')<CR>n]], { noremap = true, silent = true })
map("n", "{", "<C-O>")
map("n", "}", "<C-I>")
map("n", "(", "[m")
map("n", ")", "]m")
map("i", "jk", "<ESC>")
map("v", "<A-S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

-- LSP/Format
map("n", "<leader>fm", "<cmd> lua require('conform').format() <CR>", { desc = "Format file with Formatter" })

-- CodeLens
map("n", "<leader>rr", "<cmd> LaunchTask<CR>", { desc = "Launch Task" })
map("n", "<leader>rl", "<Cmd>lua vim.lsp.codelens.run()<CR>", { desc = "Run Code Lens" })
map("n", "<leader>rf", "<Cmd>lua vim.lsp.codelens.refresh()<CR>", { desc = "Refresh Code Lens" })

-- Copilot
map("n", "<M-M>", "<cmd> CodeCompanionActions <CR>")
map("v", "<M-M>", "<cmd> CodeCompanionActions <CR>")
map("n", "<M-m>", "<cmd>lua CopilotChatActions()<CR>")
map("v", "<M-m>", "<cmd>lua CopilotChatActions()<CR>")
map("n", "<M-p>", "<cmd> CopilotChatToggle <CR>")
map("v", "<M-p>", "<cmd> CopilotChatToggle <CR>")
map("n", "<M-P>", "<cmd> lua CopilotChatQuickPrompt()<CR>")
map("v", "<M-P>", "<cmd> lua CopilotChatQuickPrompt()<CR>")
