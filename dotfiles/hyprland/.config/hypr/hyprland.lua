--========================== MONITORS ==========================--

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1.20
})

hl.monitor({
    output = "HDMI-A-1",
    --mode = "2560x1440@144.00Hz",
    mode = "1920x1080@74.99Hz",
    position = "1600x0",
    scale = 1.0
})

--======================== MY PROGRAMS ========================--

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun"


--========================= AUTOSTART =========================--

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset -t 5000")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("/usr/bin/gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)


--=================== ENVIRONMENT VARIABLES ===================--

hl.env("GDK_BACKEND", "wayland, x11,*")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

hl.env("EGL_PLATFORM", "wayland")


--======================= LOOK AND FEEL =======================--

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 2,
        col = {
            
            active_border = "rgba(90,5,0,1)",
            inactive_border = "rgba(0,0,0,1)"
        },
        
        resize_on_border = false,
        allow_tearing = true,
        layout = "dwindle"
    },
    
    decoration = {
        rounding = 8,
        rounding_power = 2,
        active_opacity = 1,
        inactive_opacity = 1,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        }
    }
})


hl.config ({
    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = "master"
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
    }
})

-- #0F0601 -- rgb(15, 6, 1)
-- #B12608 -- rgb(177, 38, 8)
-- #D12C05 -- rgb(209, 44, 5)
-- #DE2E03 -- rgb(222, 46, 3)
-- #B75122 -- rgb(183, 81, 34)
-- #EF5E0B -- rgb(239, 94, 11)
-- #F89919 -- rgb(248, 153, 25)
-- #f2d995 -- rgb(242, 217, 149)
-- #a99768 -- rgb(169, 151, 104)

-- #471C05 rgb(71,28,3)
-- #3E260A rgb(62,38,10)
-- #401D0C rgb(64,29,12)
-- #554C34 rgb(85,76,52)

--========================= ANIMATIONS =========================--

hl.animations = {
        enabled = false,
        bezier = {
            balance = { 0.2, 1, 0.3, 1 }
        },
        animation = {
            { "windows", 1, 1.5, "balance", "slidefade 20%" },
            { "windowsIn", 1, 1.5, "balance", "slidefade 20%" },
            { "windowsOut", 1, 1.5, "balance", "slidefade 50%" },
            { "fade", 1, 2, "default" },
            { "workspaces", 1, 2, "balance", "slide" }
        }
    }


--=========================== INPUT ===========================--

hl.config ({
    input = {
        kb_layout = "us, ru",
        kb_options = "grp:win_space_toggle",
        repeat_rate = 35,
        follow_mouse = 1,
        sensitivity = -0.93,
        touchpad = {
            disable_while_typing = false,
            natural_scroll = true
        }
    }
})

hl.device({
    name = "elan1203:00-04f3:307a-touchpad",
    sensitivity = -0.05,
    scroll_factor = 0.5
})


--======================== KEYBINDINGS ========================--

local mainMod = "SUPER"

-- System binds
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.window.float({ action = "float" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("kanshictl switch standard"))
hl.bind(mainMod .. " + SHIFT + CTRL + P", hl.dsp.exec_cmd("kanshictl switch external"))
hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.exec_cmd("kanshictl switch internal"))
hl.bind(mainMod .. " + I", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + J", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + O", hl.dsp.window.fullscreen()) 
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.fullscreen_state({internal = 1, client = 2})) 
hl.bind(mainMod .. " + SHIFT + CTRL + O", hl.dsp.window.fullscreen_state({internal = 0, client = 0})) 

-- Apps exec
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("firefox-developer-edition"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(terminal .. " btop"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pavucontrol"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("throne"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("gwenview"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("/home/mxst/Downloads/Telegram/Telegram"))

-- Handy
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("handy --toggle-transcription"))

-- Hyprshot
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region -z -s -o ~/hyprshot"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m output -z -s -o ~/hyprshot"))

-- Window focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Pseudo
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 70, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = -70, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = 0, y = -35, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 0, y = 35, relative = true }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("special:magic"))

-- Scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"))


-- pin a window
-- center the current window on screen
-- focus the next window


--========================== GESTURES ==========================--

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", mods = "ALT", action = "close" })
hl.gesture({ fingers = 3, direction = "up", mods = "SUPER", scale = 1.5, action = "fullscreen" })

-- hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })


--=================== WINDOWS AND WORKSPACES ===================--

for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key,    
        hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + " .. " + SHIFT + " .. key, 
        hl.dsp.window.move({ workspace = i }))
end

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

hl.env("GDK_SCALE", "1")
hl.env("XCURSOR_SIZE", "27")
