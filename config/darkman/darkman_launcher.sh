#!/usr/bin/env bash

STATUS="$(darkman get)"
SCRIPT_DIR="$HOME/.config/darkman"

case "$STATUS" in
light)
  bash "$SCRIPT_DIR/darkman.sh"
  ;;
dark)
  bash "$SCRIPT_DIR/darkman.sh"
  ;;
*)
  exit 1
  ;;
esac
