-- Monitor configuration
-- Globals so keybinds.lua can reference them for focusmonitor/movewindow

leftMonitor  = "DP-1"
rightMonitor = "DP-2"
monitor0     = leftMonitor
monitor1     = rightMonitor

hl.monitor({
    output   = leftMonitor,
    mode     = "3840x2160@144",
    position = "0x0",
    scale    = 1.0,
    vrr      = 1,
})

hl.monitor({
    output   = leftMonitor,
    mode     = "3840x2160@95",
    position = "0x0",
    scale    = 1.0,
    vrr      = 1,
})

hl.monitor({
    output   = leftMonitor,
    mode     = "3840x2160@60",
    position = "0x0",
    scale    = 1.0,
    vrr      = 1,
})

hl.monitor({
    output   = rightMonitor,
    mode     = "preferred",
    position = "3840x0",
    scale    = 1.0,
})
