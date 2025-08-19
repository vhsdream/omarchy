#!/usr/bin/env bash

# declare some constant vars
export WAYLAND_DISPLAY="wayland-1"
DOTS="/home/${USER}/.config"
# WALL_PATH="/usr/share/backgrounds"
STARSHIP_CONFIG="$DOTS/starship/starship.toml"

# the condition
STATE="$(darkman get)"

# declare some conditional vars
if [[ "$STATE" == "light" ]]; then
  # WALLPAPER="$WALL_PATH/light/nord-lines.png"
  GTK_THEME=\"'Nordic-polar'\"
  PREF=\"'prefer-light'\"
  # BRIGHTNESS=0
else
  # WALLPAPER="$WALL_PATH/dark/dunes2.png"
  GTK_THEME=\"'Nordic-bluish-accent'\"
  PREF=\"'prefer-dark'\"
  # BRIGHTNESS=1
fi

# define the transition function
transition() {
  dconf write /org/gnome/desktop/interface/gtk-theme "$GTK_THEME"
  dconf write /org/gnome/desktop/interface/color-scheme "$PREF"
  sed -i "s/^palette = .*/palette = \"nord_${STATE}\"/" "$STARSHIP_CONFIG"
  # dbus-send --system --type=method_call --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" "int32:$BRIGHTNESS"
  # if [[ "$STATE" == "light" ]] && pgrep hyprsunset; then killall hyprsunset && sleep 1; else sleep 15 && hyprsunset -t 4750 & fi
}

# do the transition
transition
