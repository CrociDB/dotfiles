local prompts = require("CopilotChat.config.prompts")
local select = require("CopilotChat.select")

local M = {
	debug = true, -- Enable debug logging
	proxy = nil, -- [protocol://]host[:port] Use this proxy
	allow_insecure = false, -- Allow insecure server connections

	system_prompt = prompts.COPILOT_INSTRUCTIONS.system_prompt,
	model = "gpt-4.1",
	agent = "copilot", -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
	context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
	sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat.

	temperature = 0.1, -- GPT temperature
	headless = false, -- Do not write to chat buffer and use history(useful for using callback for custom processing)
	callback = nil, -- Callback to use when ask response is received

	question_header = "## User ", -- Header to use for user questions
	answer_header = "## Copilot ", -- Header to use for AI answers
	error_header = "## Error ", -- Header to use for errors
	separator = "───", -- Separator to use in chat

	show_folds = true, -- Shows folds for sections in chat
	show_help = true, -- Shows help message as virtual lines when waiting for user input
	auto_follow_cursor = true, -- Auto-follow cursor in chat
	auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
	clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
	highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

	history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history

	-- default selection (visual or line)
	selection = function(source)
		return select.visual(source) or select.line(source)
	end,

	-- default prompts
	-- see config/prompts.lua for implementation
	prompts = {
		Explain = {
			prompt = "> /COPILOT_EXPLAIN\n\nWrite an explanation for the selected code as paragraphs of text.",
		},
		Review = {
			prompt = "> /COPILOT_REVIEW\n\nReview the selected code.",
		},
		Fix = {
			prompt = "> /COPILOT_GENERATE\n\nThere is a problem in this code. Rewrite the code to show it with the bug fixed.",
		},
		Optimize = {
			prompt = "> /COPILOT_GENERATE\n\nOptimize the selected code to improve performance and readability.",
		},
		Docs = {
			prompt = "> /COPILOT_GENERATE\n\nPlease add documentation comments to the selected code.",
		},
		Tests = {
			prompt = "> /COPILOT_GENERATE\n\nPlease generate tests for my code.",
		},
		Commit = {
			prompt = "> #git:staged\n\nWrite commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
		},
	},

	-- default contexts
	-- see config/contexts.lua for implementation
	contexts = {
		buffer = {},
		buffers = {},
		file = {},
		files = {},
		git = {},
		url = {},
		register = {},
		quickfix = {},
	},

	-- default window options
	window = {
		layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
		width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
		height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
		-- Options below only apply to floating windows
		relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
		border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
		row = nil, -- row position of the window, default is centered
		col = nil, -- column position of the window, default is centered
		title = "", -- title of chat window
		footer = nil, -- footer of chat window
		zindex = 1, -- determines if window is on top or below other floating windows
	},

	-- default mappings
	-- see config/mappings.lua for implementation
	mappings = {
		complete = {
			insert = "<Tab>",
		},
		close = {
			normal = "q",
			insert = "<C-c>",
		},
		reset = {
			normal = "<C-l>",
			insert = "<C-l>",
		},
		submit_prompt = {
			normal = "<CR>",
			insert = "<C-CR>",
		},
		toggle_sticky = {
			detail = "Makes line under cursor sticky or deletes sticky line.",
			normal = "gr",
		},
		accept_diff = {
			normal = "<C-y>",
			insert = "<C-y>",
		},
		jump_to_diff = {
			normal = "gj",
		},
		quickfix_answers = {
			normal = "gqa",
		},
		quickfix_diffs = {
			normal = "gqd",
		},
		yank_diff = {
			normal = "gy",
			register = '"', -- Default register to use for yanking
		},
		show_diff = {
			normal = "gd",
			full_diff = false, -- Show full diff instead of unified diff when showing diff window
		},
		show_info = {
			normal = "gi",
		},
		show_context = {
			normal = "gc",
		},
		show_help = {
			normal = "gh",
		},
	},
}

return M
