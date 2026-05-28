-- Hyprland Lua config (migrated from hyprlang .conf)
-- Refer to the wiki for more information:
-- https://wiki.hypr.land/Configuring/Start/

-- Helper for loading config.d modules (config.d has a dot in the name,
-- which conflicts with Lua's require() path separator, so we use dofile)
local config_dir = os.getenv("HOME") .. "/.config/hypr/config.d/"

--------------------
---- MY PROGRAMS ---
--------------------

-- Set programs that you use (globals so config.d files can reference them)
terminal    = "ghostty"
fileManager = "dolphin"

------------------
---- MONITORS ----
------------------

-- Default monitor rule
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- Multi-monitor setup (may be overridden by external config)
dofile(config_dir .. "monitors.lua")

-- Load config modules
dofile(config_dir .. "autostart.lua")
dofile(config_dir .. "appearance.lua")
dofile(config_dir .. "tiling.lua")
dofile(config_dir .. "input.lua")
dofile(config_dir .. "keybinds.lua")
dofile(config_dir .. "misc.lua")


------------------------------
---- WINDOWS AND WORKSPACES --
------------------------------

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Inhibit idle for Dolphin (Slippi/Melee emulator)
hl.window_rule({
    name  = "idle-inhibit-dolphin",
    match = { initial_title = "^(Dolphin)$" },
    idle_inhibit = "always",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
