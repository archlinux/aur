#!/bin/bash

set -e

APP_NAME="flameget"
AUR_DEP="aria2p"

echo "Starting Build Process for $APP_NAME..."

if [ "$EUID" -eq 0 ]; then
  echo "Error: Please do not run this script as root (don't use sudo)."
  echo "   The script will ask for sudo password when needed."
  exit 1
fi

cd "$(dirname "$0")"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    OS_LIKE=${ID_LIKE:-""}
else
    echo "Error: Cannot detect Operating System."
    exit 1
fi

echo "Detected OS: $PRETTY_NAME"

# ==========================================
# ARCH LINUX & DERIVATIVES
# ==========================================
if [[ "$OS" == "arch" || "$OS_LIKE" == *"arch"* ]]; then
    echo "-> Running Arch Linux build process..."
    
    echo "Installing official dependencies..."
    sudo pacman -S --needed --noconfirm base-devel git python python-gobject gtk4 aria2 python-pycurl yt-dlp python-requests python-flask python-waitress
    
    if pacman -Qi $AUR_DEP &> /dev/null; then
        echo "AUR dependency '$AUR_DEP' is already installed."
    else
        echo "AUR dependency '$AUR_DEP' is MISSING."
        
        if command -v yay &> /dev/null; then
            echo "   -> Found 'yay'. Installing..."
            yay -S --noconfirm $AUR_DEP
        elif command -v paru &> /dev/null; then
            echo "   -> Found 'paru'. Installing..."
            paru -S --noconfirm $AUR_DEP
        else
            echo "   -> No AUR helper found. Building manually..."
            BUILD_DIR=$(mktemp -d)
            echo "   -> Cloning to temporary dir: $BUILD_DIR"
            
            git clone "https://aur.archlinux.org/$AUR_DEP.git" "$BUILD_DIR"
            CUR_DIR=$(pwd)
            cd "$BUILD_DIR"
            makepkg -si --noconfirm
            cd "$CUR_DIR"
            echo " '$AUR_DEP' installed successfully."
        fi
    fi
    
    echo "Building and installing $APP_NAME via makepkg..."
    makepkg -sif

# ==========================================
# DEBIAN, UBUNTU, MINT, POP!_OS, ETC.
# ==========================================
elif [[ "$OS" == "debian" || "$OS" == "ubuntu" || "$OS_LIKE" == *"debian"* || "$OS_LIKE" == *"ubuntu"* ]]; then
    echo "-> Running Debian/Ubuntu build process..."
    
    echo "Updating apt repositories..."
    sudo apt update
    
    echo "Installing system dependencies..."
    sudo apt install -y git python3 python3-pip python3-gi gir1.2-gtk-4.0 \
        gir1.2-appindicator3-0.1 aria2 python3-pycurl yt-dlp python3-requests python3-flask python3-waitress
        
    echo "Installing python package '$AUR_DEP'..."
    sudo pip3 install aria2p --break-system-packages 2>/dev/null || sudo pip3 install aria2p
    
    echo "Installing $APP_NAME system-wide..."
    APP_DIR="/usr/local/lib/$APP_NAME"
    BIN_DIR="/usr/local/bin"
    APP_SHARE="/usr/local/share/applications"
    ICON_SHARE="/usr/local/share/icons/hicolor/scalable/apps"

    sudo install -d "$APP_DIR/icons"
    sudo install -d "$BIN_DIR"
    sudo install -d "$APP_SHARE"
    sudo install -d "$ICON_SHARE"

    sudo install -m644 *.py *.json *.css "$APP_DIR/"
    sudo install -m644 xsi-*.svg "$APP_DIR/icons/" 2>/dev/null || true
    sudo install -m755 flameget.sh "$BIN_DIR/flameget"
    sudo install -m644 flameget.desktop "$APP_SHARE/"
    sudo install -m644 flameget.svg "$ICON_SHARE/"
    
    if command -v update-desktop-database &> /dev/null; then
        sudo update-desktop-database "$APP_SHARE"
    fi

# ==========================================
# UNSUPPORTED DISTROS (Fedora, openSUSE, etc.)
# ==========================================
else
    echo "Error: Your system ($PRETTY_NAME) is not supported by this script yet."
    echo "Please manually install the dependencies and copy the files."
    exit 1
fi

echo "========================================"
echo "Done! FlameGet has been installed."
echo "Run it by typing 'flameget' in your terminal or finding it in your app menu."
