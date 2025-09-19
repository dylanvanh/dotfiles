#!/usr/bin/env bash

# SketchyBar Installation Script

set -e

echo "Installing SketchyBar dependencies..."

# Install SketchyBar
brew install felixkratz/formulae/sketchybar

# Install SketchyBar App Font
brew install --cask font-sketchybar-app-font

# Make scripts executable
chmod +x ~/.config/sketchybar/plugins/*.sh
chmod +x ~/.config/sketchybar/icon_map.sh

# Start service
brew services start sketchybar

# Load configuration
sketchybar --reload

echo "Installation complete."