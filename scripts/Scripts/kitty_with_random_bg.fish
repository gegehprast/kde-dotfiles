#!/usr/bin/env fish

kitty --override background_image_layout=cscaled --override background_image=(ls -1 --icons=never --absolute --colour=never ~/Pictures/wallpapers/**/*.jpg | sort --random-sort | head -1)
