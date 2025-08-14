local wezterm = require("wezterm")
local config = {}

config.enable_tab_bar = false
config.default_prog = { "wsl.exe", "-d", "Ubuntu-24.04", "--cd", "~" }
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal" })
config.keys = {
	{
		key = "`",
		mods = "CTRL",
		action = wezterm.action.ShowDebugOverlay,
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "F11",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
config.font_size = 9.0
config.color_scheme = 'flexoki-dark'
-- config.color_scheme = 'Woodland (base16)'
-- config.color_scheme = 'Doom Peacock'
-- config.color_scheme = 'Dark+'
config.use_ime = true
config.enable_wayland = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.max_fps = 120
config.window_padding = {
	left = 0,
	right = 0,
	top = 1,
	bottom = 0,
}

return config
