#!/usr/bin/env bash

# Source colors and icons for consistent theming
source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# Get the current application
if [ "$SENDER" = "front_app_switched" ]; then
    APP_NAME="$INFO"
else
    APP_NAME=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null || echo "Unknown")
fi

# Get icon using the comprehensive icon_map.sh
ICON_RESULT=$("$CONFIG_DIR/icon_map.sh" "$APP_NAME")

# The sketchybar-app-font directly maps the icon_result to glyphs
# So we can use the result directly as the icon
ICON="$ICON_RESULT"

# Update the front_app item
sketchybar --set "$NAME" icon="$ICON" \
                        icon.color=$ACCENT_QUATERNARY \
                        label="$APP_NAME" \
                        label.color=$WHITE