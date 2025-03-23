# i3 dotfiles
Dotfiles for my EndeavourOS i3 setup. I will update this as I go.

## packages required for these dotfiles
> [!NOTE]
> for i3 packages, if on EndeavourOS, when running ```eos-packagelist --install "i3-Window-Manager"``` to install i3, i3-wm, i3blocks, i3locks and i3status, rofi, lightdm (if u use it, this one uses SDDM), mpv, feh, dunst, rofi, thunar, etc are included. however, there are still important other packages and scripts to install. I will list the ones I use here

- i3-wm
- libpulse
- brightnessctl
- bluez and bluez-utils
- feh
- rofi
- rofi-power-menu (aur or [this repo](https://github.com/jluttine/rofi-power-menu))
- betterlockscreen
- polybar
- btop
- fastfetch
- hyfetch (use fastfetch as base)
- fish
- micro
- kitty
- picom
- flameshot
- ttf-jetbrains-mono-nerd
- ttf-cascadia-mono-nerd
- sddm
- thunar
- [textfox](https://github.com/adriankarlen/textfox) (included in the dotfiles, but just in case from the AUR or github)
- alternating-layouts-git (from aur, or [the i3-alternating-layout on github](https://github.com/olemartinorg/i3-alternating-layout?tab=readme-ov-file) with the i3 config edited to find the script)
- dunst (as script isnt from AUR, i included it here from this [gitlab](https://gitlab.com/Nmoleo/i3-volume-brightness-indicator))
- autorandr (in addition to an edited version of [this monitor script](https://github.com/davatorium/rofi-scripts/blob/master/monitor_layout.sh)
- [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth/tree/master) for my polybar config if you would like, from the AUR or from the git repo if you are not on an Arch-based distribution
- [rofi-mixer](https://github.com/joshpetit/rofi-mixer), also from the aur
- [rofi-wifi-menu](https://github.com/ericmurphyxyz/rofi-wifi-menu) 

The rofi theme was edited from [rofi-themes-collection](https://github.com/newmanls/rofi-themes-collection) specifically DarkBlue by Qball.

You can also use if you would like. Right now I am figuring out how to include it as a click event in polybar the way I did for bluetooth.

Wallpaper is Haruka Kiritani's "You Deserve It" card from Project Sekai: Colorful Stage. The image is in the .wallpapers folder I have made and pointed feh to.

Plasma is still installed here so I use SDDM. Spectacle was the original screenshooter, but I have changed it to Flameshot in i3. Spectaclerc is still there in case you want to 
use it anyways.

![main](https://github.com/user-attachments/assets/77def8c2-13b9-411e-b709-3576ae2de946)
![firefox](https://github.com/user-attachments/assets/65bad86c-9cc9-4e57-993d-217b866fc202)
![newrofi](https://github.com/user-attachments/assets/0e98aa1f-8302-46a4-bb96-b477d1244dea)
![dunstvolume](https://github.com/user-attachments/assets/37e9a9ae-98cd-4cbe-bda3-edfa4e781de6)
