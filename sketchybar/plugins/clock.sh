#!/usr/bin/env bash

# Source colors for consistent theming
source "$CONFIG_DIR/colors.sh"

# Get current time in 24-hour format
LABEL=$(date "+%d/%m %H:%M")

# Set the clock label
sketchybar --set "$NAME" label="$LABEL"

