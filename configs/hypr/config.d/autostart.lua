-----------------
---- AUTOSTART --
-----------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("flatpak run com.onepassword.OnePassword --silent")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
end)
