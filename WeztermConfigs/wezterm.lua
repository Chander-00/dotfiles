local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 1. Core Options
config.enable_wayland = false
config.default_prog = { "/usr/bin/fish" }
config.color_scheme = "Kanagawa (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 0, right = 0, top = 0 }
config.max_fps = 170
config.enable_kitty_graphics = true
config.window_background_opacity = 0.80

-- 2. Font Stack
config.font = wezterm.font_with_fallback({
	{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
	{ family = "Symbols Nerd Font Mono" },
})
config.font_size = 14

-- 3. Ligatures (This replaces the broken font_rules block)
config.harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "mlig" }

return config
