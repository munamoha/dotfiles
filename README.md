# i3 + hyprland dotfiles
Dotfiles for my EndeavourOS system, with setup for both i3 and hyprland. I will update this as I go. 
>[!NOTE]
>These configs are used on a Lenovo Thinkpad 14 Gen 5 AMD, which will affect some configs, such as keybinds. Please ensure any adjustments based on your setup are made.

## packages required for these dotfiles
> [!NOTE]
> for i3 packages, if on EndeavourOS, when running ```eos-packagelist --install "i3-Window-Manager"``` to install i3, i3-wm, i3blocks, i3locks and i3status, rofi, lightdm, mpv, feh, dunst, rofi, thunar, etc are included. however, there are still important other packages and scripts to install.
> Depending on if you'd like to use my hyprland or my i3 config, I will seperate the packages below by whether they're required for one, or for both.

### used for both i3 and hyprland
- libpulse
- brightnessctl
- bluez and bluez-utils
- rofi (specifically [rofi-lbonn-wayland](https://github.com/lbonn/rofi) to allow cross compatibility with Wayland)
- rofi-power-menu (aur or [this repo](https://github.com/jluttine/rofi-power-menu))
- [rofi-mixer](https://github.com/joshpetit/rofi-mixer), also from the aur
- [rofi-wifi-menu](https://github.com/ericmurphyxyz/rofi-wifi-menu) 
- dunst (as script isnt from AUR, i included it here from this [gitlab](https://gitlab.com/Nmoleo/i3-volume-brightness-indicator))
- btop
- fastfetch
- hyfetch (use fastfetch as base)
- power-profiles-daemon
- fish
- micro
- kitty
- ttf-jetbrains-mono-nerd
- ttf-cascadia-mono-nerd
- sddm
- thunar
- [textfox](https://github.com/adriankarlen/textfox) (included in the dotfiles, but just in case from the AUR or github)
- [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth/tree/master) for my polybar config if you would like, from the AUR or from the git repo if you are not on an Arch-based distribution
- firefox (option to use theme)
- vivaldi (option)


### i3 only
- i3-wm
- picom
- feh
- polybar
- flameshot
- alternating-layouts-git (from aur, or [the i3-alternating-layout on github](https://github.com/olemartinorg/i3-alternating-layout?tab=readme-ov-file) with the i3 config edited to find the script)
- autorandr (in addition to an edited version of [this monitor script](https://github.com/davatorium/rofi-scripts/blob/master/monitor_layout.sh)

### hyprland only
- hyprland
- hyprlock
- hypridle
- hyprpaper
- hyprshot
- xdg-desktop-portal-hyprland 
- xwaylandvideobridge
- waybar
- wdisplays

The rofi theme was edited from [rofi-themes-collection](https://github.com/newmanls/rofi-themes-collection) specifically DarkBlue by Qball.

Wallpaper is Haruka Kiritani's "You Deserve It" card from Project Sekai: Colorful Stage. The second wallpaper is a Persona 5 the Animation wallpaper. The images are in the .wallpapers folder I have made and pointed feh to.

I had Plasma installed before, so I used to use tools like SDDM, Dolphin, etc. I have switched them out, as well as switching out Betterlockscreen, but betterlockscreenrc is still included. Spectacle was the original screenshooter, but I have changed it to Flameshot in i3. Spectaclerc is still there in case you want to use it anyways. As well, I may jump between sddm and lightdm once in a while, especially to test out Wayland compositors.


## i3 examples
![main](https://github.com/user-attachments/assets/77def8c2-13b9-411e-b709-3576ae2de946)
![firefox](https://github.com/user-attachments/assets/65bad86c-9cc9-4e57-993d-217b866fc202)
![newrofi](https://github.com/user-attachments/assets/0e98aa1f-8302-46a4-bb96-b477d1244dea)
![dunstvolume](https://github.com/user-attachments/assets/37e9a9ae-98cd-4cbe-bda3-edfa4e781de6)

## hyprland examples
![2025-04-02-222508_hyprshot](https://github.com/user-attachments/assets/b58deb9d-f2f1-469b-9e2a-554e4891bfe1)
![2025-04-02-223340_hyprshot](https://github.com/user-attachments/assets/2be3d593-239a-4ff0-99fc-6bdcabf3c43a)
