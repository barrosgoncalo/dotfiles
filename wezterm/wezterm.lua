local wezterm = require 'wezterm';
local act = wezterm.action
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
    -- Split Horizontally
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- Split Vertically
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Close Pane
    {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentPane { confirm = true },
    },
    -- Move tab left
    {
        key = 'LeftArrow',
        mods = 'ALT|SHIFT',
        action = act.MoveTabRelative(-1)
    },
    -- Move tab right
    {
        key = 'RightArrow',
        mods = 'ALT|SHIFT',
        action = act.MoveTabRelative(1)
    },
}
-- configure {} for European keyboard
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- sound
config.audible_bell = "Disabled"

return config;
