#!/usr/bin/env fish

# This script launch Kitty terminal with a random wallpaper from the ~/Pictures/wallpapers directory.
# Assign this script to a keyboard shortcut.

kitty --override background_image_layout=cscaled --override background_image=(ls -1 --icons=never --absolute --colour=never ~/Pictures/wallpapers/**/*.jpg | sort --random-sort | head -1)
