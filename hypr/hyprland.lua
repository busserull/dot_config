----------------
--- MONITORS ---
----------------

hl.monitor({
  output = "DP-2",
  mode = "1920x1080@60",
  position = "2560x0",
  scale = 1,
  transform = 3,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "2560x1440@120",
  position = "0x300",
  scale = 1,
})

-------------------
--- MY PROGRAMS ---
-------------------

local terminal = "alacritty"
local fileManager = "nautilus"
local menu = "wofi --show drun --prompt \"\" --hide-scroll --width 50% --no-actions"
local lock = "swaylock"
local screenshot =
"mkdir -p /home/austreng/Screenshots && slurp | grim -g - /home/austreng/Screenshots/$(date +\"%Y-%m-%dT%H:%M:%S.png\")"
local web = "firefox"

------------------
--- AUTOSTARTS ---
------------------

hl.on("hyprland.start", function()
  hl.exec_cmd(
    "waybar & swaybg -o HDMI-A-1 -i /home/austreng/.config/astronaut.png -o DP-2 -i /home/austreng/.config/space_tall.png &")
  hl.exec_cmd("hyprctl setcursor capgruv 24")
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_PATH", "/home/austreng/.local/share/icons")
hl.env("XCURSOR_THEME", "capgruv")
hl.env("HYPRCURSOR_THEME", "capgruv")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
  ecosystem = { no_update_news = true },

  general = {
    gaps_in = 2,
    gaps_out = 2,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(458588ff)", "rgba(689d6aff)" }, angle = 45 },
      inactive_border = "rgba(282828ff)",
    },
    resize_on_border = true,
    extend_border_grab_area = 15,
    hover_icon_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  cursor = {
    no_warps = true,
  },

  decoration = {
    rounding = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 12,
      render_power = 4,
      color = "rgba(45858899)",
      color_inactive = "rgba(28282877)",
    },
    blur = {
      enabled = true,
      size = 8,
      passes = 1,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    force_split = 1,
    preserve_split = true,
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 1,
  }
})

hl.curve("spike", { type = "bezier", points = { { 0.05, 0.90 }, { 0.10, 1.05 } } })
hl.curve("line", { type = "bezier", points = { { 0.00, 0.00 }, { 1.00, 1.00 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "spike" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "line" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 2, bezier = "line" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-------------
--- INPUT ---
-------------

hl.config({
  input = {
    follow_mouse = 2,
    kb_layout = "us",
    kb_options = "compose:sclk,caps:ctrl_modifier",
    sensitivity = 0.4
  },
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

-------------------
--- KEYBINDINGS ---
-------------------

local mainMod = "SUPER"
local altMod = "ALT"

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + delete", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(web))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))

hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false}))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

hl.window_rule({
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move = "20 monitor_h-120",
  float = true,
})
