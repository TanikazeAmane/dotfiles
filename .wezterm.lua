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

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    local clang64_msys2 = {
        "C:/msys64/msys2_shell.cmd",
        "-defterm",
        "-here",
        "-no-start",
        "-full-path",
        "-clang64",
        "-shell",
        "zsh"
    }
    local user = os.getenv("USERNAME")

    config.default_prog = clang64_msys2
    config.default_cwd = "C:/msys64/home/" .. user
end

return config
