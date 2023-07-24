local wezterm = require 'wezterm'
local config = {}

-- Display
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Hack Nerd Font'
config.window_padding = {
    left = 5,
    right = 5,
    top = 35, -- Large because of the location of the MBP camera.
    bottom = 0
}
--[[
config.background = {
    {
        source = {
            File = '/Users/carazoa/Pictures/Wallpapers/3840x2160-stains-purple-gradient-colorful-4k_1539369945.jpg'
        },
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
    },
}
--]]
-- Windows
--config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'

-- Functionality --
config.enable_tab_bar = false

-- Keymaps --
config.keys = {
    -- Display Bindings --
    {
        key     = 'n',
        mods    = 'SUPER|SHIFT',
        action  = wezterm.action.ToggleFullScreen
    },
    {
        key     = '+',
        mods    = 'SUPER',
        action  = wezterm.action.IncreaseFontSize
    },
    {
        key     = '-',
        mods    = 'SUPER',
        action  = wezterm.action.DecreaseFontSize
    },
    {
        key     = '0',
        mods    = 'SUPER',
        action  = wezterm.action.ResetFontSize
    },
    -- Pane Bindings  --
    {
        key     = 'Enter',
        mods    = 'SUPER|SHIFT',
        action  = wezterm.action.TogglePaneZoomState
    },
    {
        key     = 'd',
        mods    = 'SUPER',
        action  = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key     = 'd',
        mods    = 'SUPER|SHIFT',
        action  = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key     = 'w',
        mods    = 'SUPER',
        action  = wezterm.action.CloseCurrentPane { confirm = false }
    },
    {
        key     = 'LeftArrow',
        mods    = 'SUPER',
        action  = wezterm.action.ActivatePaneDirection 'Left'
    },
    {
        key     = 'RightArrow',
        mods    = 'SUPER',
        action  = wezterm.action.ActivatePaneDirection 'Right'
    },
    {
        key     = 'UpArrow',
        mods    = 'SUPER',
        action  = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
        key     = 'DownArrow',
        mods    = 'SUPER',
        action  = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
        key     = 'Tab',
        mods    = 'SUPER|SHIFT',
        action  = wezterm.action.PaneSelect { mode = 'SwapWithActive' }
    },
    -- Basic Functionality --
    {
        key     = 'c',
        mods    = 'SUPER',
        action  = wezterm.action.CopyTo 'Clipboard'
    },
}

return config
