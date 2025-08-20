#!/bin/bash

# Use dark mode for QT apps too (like kdenlive)
if ! yay -Q kvantum-qt5 &>/dev/null; then
  yay -S --noconfirm kvantum-qt5
fi

# Prefer dark mode everything
if ! yay -Q gnome-themes-extra &>/dev/null; then
  yay -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
fi

# Allow icons to match the theme
if ! yay -! yaru-icon-theme &>/dev/null; then
  yay -S --noconfirm yaru-icon-theme
fi

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Setup theme links
mkdir -p ~/.config/omarchy/themes
for f in ~/.local/share/omarchy/themes/*; do ln -nfs "$f" ~/.config/omarchy/themes/; done

# Set initial theme (start with Rose-Pine, find a way to do Nord Polar Light)
mkdir -p ~/.config/omarchy/current
ln -snf ~/.config/omarchy/themes/rose-pine ~/.config/omarchy/current/theme
ln -snf ~/.config/omarchy/current/theme/backgrounds/background.png ~/.config/omarchy/current/background

# Set specific app links for current theme
ln -snf ~/.config/omarchy/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/omarchy/current/theme/mako.ini ~/.config/mako/config

mkdir -p ~/.config/kitty
ln -sf ~/.config/omarchy/current/theme/kitty-theme.conf ~/.config/kitty/dark-theme.auto.conf
ln -sf ~/.config/omarchy/current/theme/kitty-light.conf ~/.config/kitty/light-theme.auto.conf
ln -sf ~/.config/omarchy/current/theme/kitty-light.conf ~/.config/kitty/no-preference-theme.auto.conf

# Install darkman
if ! yay -Q darkman &>/dev/null; then
  yay -S --noconfirm darkman
  mkdir -p ~/.local/share/{light-mode.d,dark-mode.d}
  ln -sf ~/.local/share/omarchy/bin/omarchy-toggle-theme-mode ~/.local/share/light-mode.d/light.sh
  ln -sf ~/.local/share/omarchy/bin/omarchy-toggle-theme-mode ~/.local/share/dark-mode.d/dark.sh
  systemctl --user enable --now darkman
fi
