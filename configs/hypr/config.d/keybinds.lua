---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local menu = "wofi"

-- Core binds
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))

-- Toggle waybar hiding
hl.bind(mainMod .. " + ALT + space", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- 1Password quick access
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("1password --quick-access"))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -o ~/Pictures/Screenshots -m region"))

-- Window management
hl.bind(mainMod .. " + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Launchers (wofi)
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(menu .. " -show drun"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(menu .. " -show run"))
-- hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(menu .. " -show window"))

-- Toggle monitor mode
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/git/dotfiles/bin/toggle_monitor_mode -t"))

-------------------------------------
---- WINDOW MANAGEMENT SUBMAP -------
-------------------------------------

-- Enter the window_management submap
hl.bind(mainMod .. " + R", hl.dsp.submap("window_management"))

hl.define_submap("window_management", function()
	hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
	hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle
	hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit")) -- dwindle

	-- Resize with arrow keys (repeating)
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

	-- Move focus within submap
	hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
	hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
	hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
	hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

	-- Move windows within submap
	hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
	hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
	hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
	hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

	-- Escape exits the submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-----------------------------------------
---- GLOBAL BINDS (outside submap) ------
-----------------------------------------

-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + hjkl
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move window to monitor
hl.bind(mainMod .. " + SHIFT + F1", hl.dsp.window.move({ monitor = monitor0, follow = false }))
hl.bind(mainMod .. " + SHIFT + F2", hl.dsp.window.move({ monitor = monitor1, follow = false }))
hl.bind(mainMod .. " + SHIFT + F3", hl.dsp.window.move({ monitor = "monitor2", follow = false }))

-- Move current workspace to monitor
hl.bind(mainMod .. " + ALT + F1", hl.dsp.workspace.move({ monitor = monitor0 }))
hl.bind(mainMod .. " + ALT + F2", hl.dsp.workspace.move({ monitor = monitor1 }))
hl.bind(mainMod .. " + ALT + F3", hl.dsp.workspace.move({ monitor = "monitor2" }))

-- Focus monitor
hl.bind(mainMod .. " + F1", hl.dsp.focus({ monitor = monitor0 }))
hl.bind(mainMod .. " + F2", hl.dsp.focus({ monitor = monitor1 }))
hl.bind(mainMod .. " + F3", hl.dsp.focus({ monitor = "monitor2" }))

-- Special workspaces (scratchpads)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("social"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:social" }))
hl.bind(mainMod .. " + CTRL + ALT + P", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CTRL + SHIFT + P", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-------------------------------
---- MULTIMEDIA KEYS ----------
-------------------------------

-- Volume
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SHIFT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SHIFT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Brightness (brightnessctl)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Media player (requires playerctl)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
