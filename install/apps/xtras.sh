#!/bin/bash

if [ -z "$OMARCHY_BARE" ]; then
  yay -S --noconfirm --needed \
    xournalpp zathura zathura-pdf-mupdf

  # Packages known to be flaky or having key signing issues are run one-by-one
  # FIXME: Add pinta back to this list when we have dealt with certificate issue
  # for pkg in typora spotify zoom; do
  #   yay -S --noconfirm --needed "$pkg" ||
  #     echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  # done
  #
  # yay -S --noconfirm --needed 1password-beta 1password-cli ||
  #   echo -e "\e[31mFailed to install 1password. Continuing without!\e[0m"
fi

# Copy over Omarchy applications
source omarchy-refresh-applications || true
