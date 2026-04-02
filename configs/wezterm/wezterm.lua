-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Atom'
config.color_scheme = 'Belge (terminal.sexy)'

config.front_end = 'WebGpu'

config.enable_wayland = false

config.hide_tab_bar_if_only_one_tab = true

config.font_size = 10

config.font = wezterm.font {
    family = 'Inconsolata Nerd Font Mono',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
}
-- config.font_hinting = 'Full'

-- config.dpi = 196

-- and finally, return the configuration to wezterm


config.keys = {
  --{ key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
  --{ key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize }
}

return config

