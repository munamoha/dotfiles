# i3 dotfiles
Dotfiles for my EndeavourOS i3 setup. I will update this as I go.

## packages required for these dotfiles
> [!NOTE]
> for i3 packages, if on EndeavourOS, other than i3-wm, i3blocks, i3locks and i3status, rofi, lightdm (if u use it, this one uses SDDM), mpv, feh, dunst, rofi, thunar, etc are included when running ```eos-packagelist --install "i3-Window-Manager"``` to install i3. however, there are still important other packages to install.

- i3-wm
- libpulse
- brightnessctl
- bluez and bluez-utils
- feh
- rofi
- betterlockscreen
- polybar
- btop
- fastfetch
- fish
- micro
- kitty
- picom
- flameshot
- ttf-jetbrains-mono-nerd
- ttf-cascadia-mono-nerd
- (from aur, or [the i3-alternating-layout on github](https://github.com/olemartinorg/i3-alternating-layout?tab=readme-ov-file) with the i3 config edited to find the script)
- alternating-layouts-git
- dunst (as script isnt from AUR, i included it here from this [gitlab](https://gitlab.com/Nmoleo/i3-volume-brightness-indicator))
  
As well, download [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth/tree/master) for my polybar config if you would like, from the AUR or from the git repo if you are not on an Arch-based distribution. Similarly download [rofi-mixer](https://github.com/joshpetit/rofi-mixer), also from the aur

My firefox theme is added here, downloaded from the AUR package of [textfox](https://github.com/adriankarlen/textfox)

The rofi theme comes from [rofi-themes-collection](https://github.com/newmanls/rofi-themes-collection) specifically DarkBlue by Qball.

You can also use [rofi-wifi-menu](https://github.com/ericmurphyxyz/rofi-wifi-menu) if you would like. Right now I am figuring out how to include it as a click event in polybar the way I did for bluetooth.

Wallpaper is Haruka Kiritani's "You Deserve It" card from Project Sekai: Colorful Stage. The image is in the .wallpapers folder I have made and pointed feh to.

Plasma is still installed here so I use SDDM. Spectacle was the original screenshooter, but I have changed it to Flameshot in i3. Spectaclerc is still there in case you want to use it anyways.


![i3 ricing](https://github.com/user-attachments/assets/381bcdd8-d506-4ffc-9632-a439bb43e09d)
![notion + firefox](https://github.com/user-attachments/assets/439aa820-9dc1-4eb0-9629-9c92c6af8a0c)
![drun + firefox](https://github.com/user-attachments/assets/6f46d6ba-80ed-4433-a5dd-c7405367bfa7)
