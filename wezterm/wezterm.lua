local wezterm = require 'wezterm';
local config = wezterm.config_builder();

-- zsh
config.default_prog = { '/bin/zsh', '-l' }

-- theme
config.color_scheme = "GruvboxDark"
-- config.color_scheme = "Gruvbox Material (Gogh)"

-- disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- font
config.font = wezterm.font("JetBrains Mono")
-- disable tab bar
config.enable_tab_bar = false
-- font size
config.font_size = 14.0

-- keys
config.use_dead_keys = false
config.keys = {
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
}
-- configure {} for European keyboard
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- sound
config.audible_bell = "Disabled"

return config;
