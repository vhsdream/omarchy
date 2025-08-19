#!/bin/bash

# Setting the performance profile can make a big difference. By default, most systems seem to start in balanced mode,
# even if they're not running off a battery. So let's make sure that's changed to performance.
yay -S --noconfirm python-gobject power-profiles-daemon

if ls /sys/class/power_supply/BAT* &>/dev/null; then
  # This computer runs on a battery
  powerprofilesctl set balanced || true

  # Enable battery monitoring timer for low battery notifications
  if [ -n "${OMARCHY_CHROOT_INSTALL:-}" ]; then
    systemctl --user enable omarchy-battery-monitor.timer
  else
    systemctl --user enable --now omarchy-battery-monitor.timer
  fi
else
  # This computer runs on power outlet
  powerprofilesctl set performance || true
fi
