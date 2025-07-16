local wezterm = require("wezterm")
local config = {}

config.enable_tab_bar = false
config.default_prog = { "ubuntu.exe" }
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
config.font_size = 12.0
config.color_scheme = "N0tch2k"
config.use_ime = true
config.enable_wayland = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.max_fps = 120
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

return config
