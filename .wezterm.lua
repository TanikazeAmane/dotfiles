local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.window_background_opacity = 0.7
config.enable_scroll_bar = true
config.animation_fps = 60

config.color_scheme = 'OneDark (base16)'
config.default_cursor_style = 'BlinkingBlock'
config.font = wezterm.font 'MesloLGS Nerd Font Mono'

config.initial_rows = 45
config.initial_cols = 150

config.scrollback_lines = 50000

return config
