#!/bin/bash -e

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

    if ! command -v unzip >/dev/null 2>&1; then
        printf "%b\n" '\033[0;33munzip not found. Installing unzip...\033[0m'
        $PKG_MANAGER unzip
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

# List of available fonts using release page names
fonts="
0xProto
3270
Agave
AnonymousPro
Arimo
AurulentSansMono
BigBlueTerminal
BitstreamVeraSansMono
CascadiaCode
CascadiaMono
CodeNewRoman
ComicShannsMono
CommitMono
Cousine
D2Coding
DaddyTimeMono
DejaVuSansMono
DroidSansMono
EnvyCodeR
FantasqueSansMono
FiraCode
FiraMono
GeistMono
Go-Mono
Gohu
Hack
Hasklig
HeavyData
Hermit
iA-Writer
IBMPlexMono
Inconsolata
InconsolataGo
InconsolataLGC
IntelOneMono
Iosevka
IosevkaTerm
IosevkaTermSlab
JetBrainsMono
Lekton
LiberationMono
Lilex
MartianMono
Meslo
Monaspace
Monofur
Monoid
Mononoki
MPlus
NerdFontsSymbolsOnly
Noto
OpenDyslexic
Overpass
ProFont
ProggyClean
Recursive
RobotoMono
ShareTechMono
SourceCodePro
SpaceMono
Terminus
Tinos
Ubuntu
UbuntuMono
UbuntuSans
VictorMono
ZedMono
"

# Format the font list into three columns, adjusting for variable lengths
format_fonts_into_columns() {
    printf "%b\n" "$fonts" | nl -w 2 -s '. ' | awk '{printf "%-35s", $0; if(NR % 3 == 0) print "";}'
}

# Display menu of available fonts in three columns
printf "%b\n" '\033[0;32mSelect fonts to install (separate with spaces):\033[0m'
printf "%b\n" "---------------------------------------------"
format_fonts_into_columns
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
    font_index=$((selection))  # Get the user input number
    font_index=$((font_index + 1))  # Increment by 1 for the correct index
    font=$(printf "%b\n" "$fonts" | sed -n "${font_index}p")  # Get the font based on adjusted index
    if [ -z "$font" ]; then
        printf "%b\n" '\033[0;31mInvalid selection: '"$selection"'\033[0m'
        continue
    fi
    printf "%b\n" '\033[0;34mDownloading and installing '"$font"'\033[0m'
    font_name=$(printf "%b\n" "$font" | awk '{print $1}')
    curl -sSLo "$HOME/tmp/$font_name.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
    unzip -o "$HOME/tmp/$font_name.zip" -d "$HOME/.local/share/fonts"
    rm "$HOME/tmp/$font_name.zip"
done

# Update font cache
fc-cache -vf
