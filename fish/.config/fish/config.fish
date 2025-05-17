source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
   ascii-image-converter ~/.config/fish/logo.png -C -d 50,19 | fastfetch --file-raw -
end

starship init fish | source
