local M = {
	legacy_commands = false,

	workspaces = {
		{
			name = "notes",
			path = "~/Projects/notes",
		},
		{
			name = "devnotes",
			path = "~/Projects/devnotes",
		},
	},

	completion = {
		min_chars = 2,
	},

	picker = {
		name = "telescope.nvim",
	},
}

return M
