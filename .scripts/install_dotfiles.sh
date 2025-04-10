#!/bin/bash

# Dotfiles Installation Script
DOTFILES_REPO="https://github.com/munamoha/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup"
PKG_LISTS_DIR="$HOME/.dotfiles-pkg-lists"

# Function to prompt for WM selection at the beginning
select_wm() {
    echo "Please select window manager configuration:"
    echo "1) i3 only"
    echo "2) Hyprland only"
    echo "3) Both i3 and Hyprland"
    read -p "Enter your choice [1-3]: " -n 1 -r
    echo
    
    case $REPLY in
        1) INSTALL_I3=true; INSTALL_HYPRLAND=false ;;
        2) INSTALL_I3=false; INSTALL_HYPRLAND=true ;;
        3) INSTALL_I3=true; INSTALL_HYPRLAND=true ;;
        *) echo "Invalid selection. Exiting."; exit 1 ;;
    esac
}

# Function to detect AUR helper
detect_aur_helper() {
    local helpers=("yay" "paru" "pikaur" "trizen")
    for helper in "${helpers[@]}"; do
        if command -v "$helper" &> /dev/null; then
            echo "$helper"
            return 0
        fi
    done
    echo ""
}

# Function to setup package installation method
setup_pkg_installation() {
    AUR_HELPER=$(detect_aur_helper)
    
    if [ -n "$AUR_HELPER" ]; then
        echo "Detected AUR helper: $AUR_HELPER"
        if [ "$AUR_HELPER" != "yay" ]; then
            export_pkg_lists
            show_manual_instructions
            exit 0
        fi
    else
        echo "No AUR helper detected."
        read -p "Would you like to install yay? [Y/n] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Nn]$ ]]; then
            export_pkg_lists
            show_manual_instructions
            exit 0
        else
            install_yay
            AUR_HELPER="yay"
        fi
    fi
}

# Function to install yay
install_yay() {
    echo "Installing yay..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si)
}

# Function to export package lists
export_pkg_lists() {
    mkdir -p "$PKG_LISTS_DIR"
    
    # Common packages
    printf "%s\n" "${common_pkgs[@]}" > "$PKG_LISTS_DIR/common-packages.txt"
    
    # i3 packages
    if [ "$INSTALL_I3" = true ]; then
        printf "%s\n" "${i3_pkgs[@]}" > "$PKG_LISTS_DIR/i3-packages.txt"
    fi
    
    # Hyprland packages
    if [ "$INSTALL_HYPRLAND" = true ]; then
        printf "%s\n" "${hyprland_pkgs[@]}" > "$PKG_LISTS_DIR/hyprland-packages.txt"
    fi
}

# Function to show manual instructions
show_manual_instructions() {
    echo -e "\nPackage lists have been saved to: $PKG_LISTS_DIR"
    echo "Please install these packages using your preferred AUR helper."
    echo -e "\nExample commands:"
    
    if [ -f "$PKG_LISTS_DIR/common-packages.txt" ]; then
        echo -e "\nFor common packages:"
        echo "$AUR_HELPER -S --needed - < $PKG_LISTS_DIR/common-packages.txt"
    fi
    
    if [ "$INSTALL_I3" = true ] && [ -f "$PKG_LISTS_DIR/i3-packages.txt" ]; then
        echo -e "\nFor i3 packages:"
        echo "$AUR_HELPER -S --needed - < $PKG_LISTS_DIR/i3-packages.txt"
    fi
    
    if [ "$INSTALL_HYPRLAND" = true ] && [ -f "$PKG_LISTS_DIR/hyprland-packages.txt" ]; then
        echo -e "\nFor Hyprland packages:"
        echo "$AUR_HELPER -S --needed - < $PKG_LISTS_DIR/hyprland-packages.txt"
    fi
    
    echo -e "\nAfter installing packages, run this script again to setup dotfiles."
}

# Function to setup dotfiles
setup_dotfiles() {
    if [ -d "$DOTFILES_DIR" ]; then
        echo "Warning: $DOTFILES_DIR already exists on this system."
        echo "This script will not proceed to avoid conflicts."
        echo "If you want to reinstall, please remove or backup the existing directory."
        exit 1
    fi

    echo "Creating backup directory at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"

    backup_dotfile() {
        local file=$1
        if [ -e "$HOME/$file" ]; then
            echo "Backing up $file to $BACKUP_DIR..."
            mv "$HOME/$file" "$BACKUP_DIR/"
        fi
    }

    echo "Cloning dotfiles as bare repository..."
    git clone --bare "$DOTFILES_REPO" "$DOTFILES_DIR"

    function dotfiles {
        git --git-dir="$DOTFILES_DIR" --work-tree="$HOME" "$@"
    }

    echo "Checking out dotfiles..."
    if ! dotfiles checkout; then
        echo "Backing up conflicting dotfiles..."
        dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | while read -r file; do
            mkdir -p "$BACKUP_DIR/$(dirname "$file")"
            backup_dotfile "$file"
        done
        dotfiles checkout
    fi

    dotfiles config status.showUntrackedFiles no
}

# Package lists
common_pkgs=(
    brightnessctl bluez bluez-utils dunst
    btop fastfetch hyfetch fish micro kitty
    ttf-jetbrains-mono-nerd ttf-cascadia-mono-nerd
    thunar firefox vivaldi libpulse
    rofi-lbonn-wayland-git rofi-power-menu
    rofi-mixer-git rofi-wifi-menu-git
    rofi-bluetooth-git
)

i3_pkgs=(
    i3-wm picom feh polybar flameshot
    autorandr alternating-layouts-git
)

hyprland_pkgs=(
    hyprland hyprlock hypridle hyprpaper
    hyprshot xwaylandvideobridge
    waybar wdisplays
    xdg-desktop-portal-hyprland
)

# Main execution flow
select_wm  # WM selection prompt at the beginning
check_dependencies
setup_pkg_installation

# Only proceed with automated installation if using yay
if [ "$AUR_HELPER" = "yay" ]; then
    echo "Proceeding with automated installation using yay..."
    
    # Common packages
    yay -S --needed "${common_pkgs[@]}" || {
        echo "Error installing common packages"
        exit 1
    }
    
    # i3 packages
    if [ "$INSTALL_I3" = true ]; then
        yay -S --needed "${i3_pkgs[@]}" || {
            echo "Error installing i3 packages"
            exit 1
        }
    fi
    
    # Hyprland packages
    if [ "$INSTALL_HYPRLAND" = true ]; then
        yay -S --needed "${hyprland_pkgs[@]}" || {
            echo "Error installing Hyprland packages"
            exit 1
        }
    fi
    
    setup_dotfiles
    echo -e "\nInstallation complete!"
    [ "$INSTALL_I3" = true ] && echo "- i3 configuration installed"
    [ "$INSTALL_HYPRLAND" = true ] && echo "- Hyprland configuration installed"
    echo "Your existing dotfiles have been backed up to $BACKUP_DIR"
fi
