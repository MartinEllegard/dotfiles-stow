-- local config = require("config")
-- return config
local wezterm = require 'wezterm'
return {
    color_scheme = 'Gruvbox Dark (Gogh)',
    -- color_scheme = 'Tomorrow Night Blue',
    enable_tab_bar = false,
    font_size = 13.0,

    -- macos_window_background_blur = 40,
    window_background_opacity = 0.75,
    window_decorations = 'RESIZE',
    keys = require("keybindings"),
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
}
