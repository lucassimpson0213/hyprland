-- ~/.config/hypr/hyprland.lua
-- Personal Hyprland config.
-- Keeps the starter/default-style keybind muscle memory where possible.
------------------
---- MONITORS ----
hl.monitor({
    output   = "desc:ASUSTek COMPUTER INC VG32UQA1A R7LMAS001006",
    mode     = "3840x2560@60",
    position = "0x0",
    scale    = 2,
})

hl.monitor({
    output   = "desc:ASUSTek COMPUTER INC VG27AQ1A 0x9195A922",
    mode     = "preferred",
    position = "2560x0",
    scale    = 2,
    disabled = true
})

hl.monitor({
    output   = "eDP-1",
    disabled = true,
}) ---------------------

-- External ASUS monitor: main workspaces
hl.workspace_rule({
    workspace = "1",
    monitor = "DP-2",
    default = true,
})

hl.workspace_rule({
    workspace = "2",
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = "3",
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = "4",
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = "5",
    monitor = "DP-2",
})

-- Laptop panel: secondary/persistent stuff
hl.workspace_rule({
    workspace = "6",
    monitor = "DP-1",
    default = true,
})

hl.workspace_rule({
    workspace = "7",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "8",
    monitor = "DP-1",
})

-----------------
---- PROGRAMS ----
-----------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- hl.exec_cmd("waybar")
    hl.exec_cmd("noctalia")
    -- hl.exec_cmd("mako")
    -- hl.exec_cmd("hyprpaper")
    -- hl.exec_cmd("hypridle")
    -- hl.exec_cmd("hyprpolkitagent")

    -- Clipboard history daemon.
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")

    -- Enable once you have configured hyprpaper.
    -- hl.exec_cmd("hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 20,

        border_size      = 2,

        col              = {
            active_border   = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow           = {
            enabled      = false,
            -- range        = 4,
            -- render_power = 3,
            -- color        = 0xee1a1a1a,
        },

        blur             = {
            enabled  = false,
            -- size     = 3,
            -- passes   = 1,
            -- vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

------------------
---- ANIMATIONS ---
------------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } },
})

hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 71.2633,
    dampening = 15.8274,
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",     enabled = true, speed = 2.5, spring = "easy" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3.0, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 1.5, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.8, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slidefade 20%" })

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad     = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Apps
-- Preserved: Super+Q opens terminal.

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty tmux new-session -A -s main"))

hl.bind(
    "SUPER + W",
    hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/tmux-workspace")
)

hl.bind(
    mainMod .. "+ D",
    hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/open-desktop-files-menu")
)

hl.bind(
    "SUPER + H",
    hl.dsp.exec_cmd("kitty nvim " .. os.getenv("HOME") .. "/.config/hypr/hyprland.lua")
)
hl.bind(
    "SUPER + SHIFT + M",
    hl.dsp.exec_cmd(
        "kitty hyprctl reload && hyprctl dispatch dpms off && sleep 2 && hyprctl dispatch dpms on"
    )
)


-- Extra terminal shortcut, also preserved from your earlier custom section.
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal), {
    description = "App: Terminal",
})

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), {
    description = "App: File manager",
})

-- Preserved: Super+R opens app launcher.
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu), {
    description = "App: Launcher",
})

-- Window controls
-- Preserved: Super+C closes the focused window.
hl.bind(mainMod .. " + C", hl.dsp.window.close(), {
    description = "Window: Close",
})

-- Preserved: Super+V toggles floating.
hl.bind(mainMod .. " + V", hl.dsp.window.float({
    action = "toggle",
}), {
    description = "Window: Float or tile",
})

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), {
    description = "Window: Pseudo tile",
})

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), {
    description = "Layout: Toggle split",
})

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({
    mode   = "fullscreen",
    action = "toggle",
}), {
    description = "Window: Fullscreen",
})

-- Focus windows with arrow keys.
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "d" }))

-- Move window to another workspace and follow it.
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({
    workspace = "r-1",
    follow = true,
}))

hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({
    workspace = "r+1",
    follow = true,
}))

-- Keep these as normal tile movement.
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
-- Mouse move / resize.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
    description = "Window: Move",
})

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
    description = "Window: Resize",
})

-- Workspaces: Super + 1–0 focuses; Super + Shift + 1–0 moves window.
for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({
        workspace = i,
    }), {
        description = "Workspace: Focus " .. i,
    })

    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({
        workspace = i,
    }), {
        description = "Workspace: Move window to " .. i,
    })
end

-- Preserved: Super + mouse wheel cycles through existing workspaces.
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({
    workspace = "r+1",
}), {
    description = "Workspace: Next",
})

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({
    workspace = "r-1",
}), {
    description = "Workspace: Previous",
})

-- Preserved scratchpad naming: "magic".
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), {
    description = "Workspace: Toggle scratchpad",
})

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({
    workspace = "special:magic",
}), {
    description = "Workspace: Send window to scratchpad",
})

-- Relative workspace navigation.
hl.bind(mainMod .. " + ALT + Left", hl.dsp.focus({
    workspace = "r-1",
}), {
    description = "Workspace: Previous",
})

hl.bind(mainMod .. " + ALT + Right", hl.dsp.focus({
    workspace = "r+1",
}), {
    description = "Workspace: Next",
})

-- Utilities
-- Clipboard goes on Shift+V so Super+V can remain float/tile.
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(
    "cliphist list | wofi --dmenu | cliphist decode | wl-copy"
), {
    description = "Utilities: Clipboard history",
})

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(
    'grim -g "$(slurp)" - | wl-copy'
), {
    description = "Utilities: Region screenshot",
})

-- NOTE: This intentionally replaces the scratchpad-send bind above.
-- Use Super+Alt+S to send a window to the scratchpad instead.
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({
    workspace = "special:magic",
}), {
    description = "Workspace: Send window to scratchpad",
})

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), {
    description = "Utilities: Pick color",
})

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"), {
    description = "Session: Lock",
})

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"), {
    description = "Session: Reload config",
})

-- Audio
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true })

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true })

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true })

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true })

hl.bind("XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true })

----------------------------
---- WINDOW / APP RULES ----
----------------------------

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
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

hl.window_rule({
    name  = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },

    move  = "20 monitor_h-120",
    float = true,
})

-- For Noctalia Color templates
require("noctalia").apply_theme()
