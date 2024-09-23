#!/usr/bin/sh

# Function to detect the OS and set the package manager
detect_os_and_set_package_manager() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu|debian)
                PKG_MANAGER="sudo apt-get update && sudo apt-get install -y"
                ;;
            fedora)
                PKG_MANAGER="sudo dnf install -y"
                ;;
            centos|rhel)
                PKG_MANAGER="sudo yum install -y"
                ;;
            arch)
                PKG_MANAGER="sudo pacman -Syu --noconfirm"
                ;;
            *)
                printf "%b\n" '\033[0;31mUnsupported OS: '"$ID"'\033[0m'  
                exit 1
                ;;
        esac
    else
        printf "%b\n" '\033[0;31mOS detection failed. Please install curl, tar, and fontconfig manually.\033[0m'  
        exit 1
    fi
}

# Function to check and install dependencies
install_dependencies() {
    if ! command -v curl >/dev/null 2>&1; then
        printf "%b\n" '\033[0;33mcurl not found. Installing curl...\033[0m'  
        $PKG_MANAGER curl
    fi

    if ! command -v tar >/dev/null 2>&1; then
        printf "%b\n" '\033[0;33mtar not found. Installing tar...\033[0m'  
        $PKG_MANAGER tar
    fi

    if ! command -v fc-cache >/dev/null 2>&1; then
        printf "%b\n" '\033[0;33mfontconfig (fc-cache) not found. Installing fontconfig...\033[0m'  
        $PKG_MANAGER fontconfig
    fi
}

# Detect OS and set package manager
detect_os_and_set_package_manager

# Check and install dependencies
install_dependencies

# Create directory for fonts
mkdir -p "$HOME/.local/share/fonts"

# Create tmp directory if it doesn't exist
mkdir -p "$HOME/tmp"

# List of available fonts
fonts="
0xProto Nerd Font
3270 Nerd Font
Agave Nerd Font
AnonymicePro Nerd Font
Arimo Nerd Font
AurulentSansMono Nerd Font
BigBlueTerminal Nerd Font
BitstromWera Nerd Font
BlexMono Nerd Font
CaskaydiaCove Nerd Font
CaskaydiaMono Nerd Font
CodeNewRoman Nerd Font
ComicShannsMono Nerd Font
CommitMono Nerd Font
Cousine Nerd Font
D2Coding Nerd Font
DaddyTimeMono Nerd Font
DejaVuSansMono Nerd Font
DroidSansMono Nerd Font
EnvyCodeR Nerd Font
FantasqueSansMono Nerd Font
FiraCode Nerd Font
FiraMono Nerd Font
GeistMono Nerd Font
GoMono Nerd Font
Gohu Nerd Font
Hack Nerd Font
Hasklug Nerd Font
HeavyDataMono Nerd Font
Hurmit Nerd Font
iM-Writing Nerd Font
Inconsolata Nerd Font
InconsolataGo Nerd Font
InconsolataLGC Nerd Font
IntoneMono Nerd Font
Iosevka Nerd Font
IosevkaTerm Nerd Font
IosevkaTermSlab Nerd Font
JetBrainsMono Nerd Font
Lekton Nerd Font
Literation Nerd Font
Lilex Nerd Font
MartianMono Nerd Font
Meslo Nerd Font
Monaspice Nerd Font
Monofur Nerd Font
Monoid Nerd Font
Mononoki Nerd Font
M+ Nerd Font
Noto Nerd Font
OpenDyslexic Nerd Font
Overpass Nerd Font
ProFont Nerd Font
ProggyClean Nerd Font
RecMono Nerd Font
RobotoMono Nerd Font
SauceCodePro Nerd Font
ShureTechMono Nerd Font
SpaceMono Nerd Font
Terminess Nerd Font
Tinos Nerd Font
Ubuntu Nerd Font
UbuntuMono Nerd Font
VictorMono Nerd Font
ZedMono Nerd Font
"

# Format the font list into three columns
format_fonts_into_columns() {
    printf "%b\n" "$fonts" | nl | awk '{printf "%-40s", $0; if (NR%3==0) printf "\n"} END {if (NR%3!=0) printf "\n"}'
}

# Display menu of available fonts in three columns with 'more'
printf "%b\n" '\033[0;32mSelect fonts to install (separate with spaces):\033[0m'  
printf "%b\n" "---------------------------------------------"
format_fonts_into_columns | more  # Use 'more' to paginate font list in three columns
printf "%b\n" "---------------------------------------------"

# Prompt user to select fonts and validate input
while true; do
    printf "%b\n" '\033[0;36mEnter the numbers of the fonts to install (e.g., "1 2 3"): \033[0m'  
    read -r font_selection

    # Check if user has made a selection
    if [ -n "$font_selection" ]; then
        break  # Exit loop if input is not empty
    else
        printf "%b\n" '\033[0;31mPlease select at least one font.\033[0m'  
    fi
done

# Download and install selected fonts
for selection in $font_selection; do
    font=$(printf "%b\n" "$fonts" | sed -n "${selection}p")  # Extract font based on user selection
    if [ -z "$font" ]; then
        printf "%b\n" '\033[0;31mInvalid selection: '"$selection"'\033[0m'  
        continue
    fi
    printf "%b\n" '\033[0;34mDownloading and installing '"$font"'\033[0m'  
    font_name=$(printf "%b\n" "$font" | awk '{print $1}')
    curl -sSLo "$HOME/tmp/$font_name.tar.xz" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.tar.xz"
    tar -xf "$HOME/tmp/$font_name.tar.xz" -C "$HOME/.local/share/fonts"
    rm "$HOME/tmp/$font_name.tar.xz"
done

# Update font cache
fc-cache -vf
