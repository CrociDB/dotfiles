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
		["<C-e>"] = { "accept", "fallback" },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
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

	snippets = { preset = "luasnip" },

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
			border = "solid",

			draw = {
				padding = { 0, 1 },
				columns = { { "kind_icon", gap = 1 }, { "label", gap = 1 }, { "kind" } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
					kind_icon = {
						text = function(ctx)
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							else
								icon = require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
								})
							end

							return " " .. icon .. ctx.icon_gap
						end,

						highlight = function(ctx)
							local hl = ctx.kind_hl
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
					},
				},
			},
		},

		-- Show documentation when selecting a completion item
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 400,
			window = {
				border = "solid",
			},
		},

		-- Display a preview of the selected item on the current line
		ghost_text = { enabled = true },
	},
}

return M
