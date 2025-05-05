local M = {
	workspaces = {
		{
			name = "notes",
			path = "~/Projects/Notes/",
		},
		{
			name = "devnotes",
			path = "~/Projects/devnotes/",
		},
	},

	completion = {
		nvim_cmp = false,
		blink = true,
		min_chars = 2,
	},
}

return M
