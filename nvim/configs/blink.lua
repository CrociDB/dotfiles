local M = {
	enabled = function()
		-- return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
    return true
	end,

	keymap = {
		preset = "default",
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Enter>"] = { "accept", "fallback" },
	},

	sources = {
		default = { "lsp", "path", "snippets" },
		providers = {
			snippets = {
				should_show_items = function(ctx)
					return ctx.trigger.initial_kind ~= "trigger_character"
				end,
			},
		},
		-- providers = {
		-- 	buffer = {
		-- 		opts = {
		-- 			get_bufnrs = function()
		-- 				return vim.tbl_filter(function(bufnr)
		-- 					return vim.bo[bufnr].buftype == ""
		-- 				end, vim.api.nvim_list_bufs())
		-- 			end,
		-- 		},
		-- 	},
		-- },
	},

	snippets = { preset = "default" },

	signature = {
		enabled = false,
		window = {
			show_documentation = false,
		},
	},

	fuzzy = {
		sorts = {
			"exact",
			"score",
			"sort_text",
		},
	},

	completion = {
		-- 'prefix' will fuzzy match on the text before the cursor
		-- 'full' will fuzzy match on the text before _and_ after the cursor
		-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
		keyword = { range = "full" },

		trigger = {
			show_on_accept_on_trigger_character = true,
			show_on_keyword = false,
			show_on_trigger_character = true,
		},

		-- Disable auto brackets
		-- NOTE: some LSPs may add auto brackets themselves anyway
		accept = { auto_brackets = { enabled = true } },

		-- Don't select by default, auto insert on selection
		list = { selection = { preselect = true, auto_insert = false } },

		menu = {
			auto_show = true,

			draw = {
				-- We don't need label_description now because label and label_description are aljjready
				-- combined together in label by colorful-menu.nvim.
				columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},

		-- Show documentation when selecting a completion item
		documentation = { auto_show = true, auto_show_delay_ms = 500 },

		-- Display a preview of the selected item on the current line
		ghost_text = { enabled = true },
	},
}

return M
