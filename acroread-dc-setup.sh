#!/bin/bash
# Adobe Acrobat Reader DC setup script for Arch Linux

set -e

APPDIR="/opt/acroread-dc-wine"
WINEPREFIX="${HOME}/.local/share/acroread-dc-wine"
TMPDIR="${TMPDIR:-/tmp}"
INSTALLER="$APPDIR/AcroRdrDC_installer.exe"

export WINEPREFIX
export WINEDEBUG="-all"

echo "=================================="
echo "Adobe Acrobat Reader DC Setup"
echo "=================================="
echo ""
echo "This will install Adobe Acrobat Reader DC via Wine."
echo "Wine prefix: $WINEPREFIX"
echo ""

# Create Wine prefix
if [[ ! -d "$WINEPREFIX" ]]; then
    echo "[1/5] Creating Wine prefix..."
    mkdir -p "$WINEPREFIX"
    wineboot --init
    wineserver -w
else
    echo "[1/5] Wine prefix already exists."
fi

# Install required Windows components
echo "[2/5] Installing Windows components (this may take a while)..."
winetricks --unattended mspatcha > /dev/null 2>&1 || true
winetricks --unattended riched20 > /dev/null 2>&1 || true
winetricks --unattended vcrun2015 > /dev/null 2>&1 || true
wineserver -w

# Link system fonts
echo "[3/5] Linking system fonts..."
FONTS_DIR="$WINEPREFIX/drive_c/windows/Fonts"
mkdir -p "$FONTS_DIR"
find /usr/share/fonts -type f \( -name "*.ttf" -o -name "*.ttc" -o -name "*.otf" \) -exec ln -sf {} "$FONTS_DIR/" \; 2>/dev/null || true

# Extract and install Adobe Reader
echo "[4/5] Installing Adobe Acrobat Reader DC..."
EXTRACT_DIR="$TMPDIR/acroread-dc-extract-$$"
mkdir -p "$EXTRACT_DIR"

7z x "$INSTALLER" -o"$EXTRACT_DIR" -y > /dev/null 2>&1

if [[ -f "$EXTRACT_DIR/setup.exe" ]]; then
    wine "$EXTRACT_DIR/setup.exe" /sAll
    wineserver -w
else
    echo "Error: Could not find setup.exe in extracted files"
    rm -rf "$EXTRACT_DIR"
    exit 1
fi

rm -rf "$EXTRACT_DIR"

# Apply registry tweaks
echo "[5/5] Applying configuration..."
if [[ -f "$APPDIR/acroread-dc.reg" ]]; then
    wine regedit "$APPDIR/acroread-dc.reg" 2>/dev/null || true
    wineserver -w
fi

# Set Windows 7 compatibility mode
winetricks --unattended win7 > /dev/null 2>&1 || true

# Disable services that don't work properly in Wine
for PROG_FILES in "$WINEPREFIX/drive_c/Program Files (x86)" "$WINEPREFIX/drive_c/Program Files"; do
    COMMON_FILES="$PROG_FILES/Common Files/Adobe/ARM/1.0"
    if [[ -d "$COMMON_FILES" ]]; then
        for f in armsvc.exe AdobeARM.exe AdobeARMHelper.exe; do
            if [[ -f "$COMMON_FILES/$f" ]]; then
                mv "$COMMON_FILES/$f" "$COMMON_FILES/${f}_disabled" 2>/dev/null || true
            fi
        done
    fi

    READER_DIR="$PROG_FILES/Adobe/Acrobat Reader DC/Reader"
    if [[ -d "$READER_DIR" ]]; then
        for f in AdobeCollabSync.exe; do
            if [[ -f "$READER_DIR/$f" ]]; then
                mv "$READER_DIR/$f" "$READER_DIR/${f}_disabled" 2>/dev/null || true
            fi
        done
        if [[ -d "$READER_DIR/AcroCEF" ]]; then
            for f in RdrServicesUpdater.exe; do
                if [[ -f "$READER_DIR/AcroCEF/$f" ]]; then
                    mv "$READER_DIR/AcroCEF/$f" "$READER_DIR/AcroCEF/${f}_disabled" 2>/dev/null || true
                fi
            done
        fi
    fi
done

# Disable Wine debugger popup
wine reg add "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug" /v Debugger /t REG_SZ /d "" /f 2>/dev/null || true
wine reg add "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug" /v Debugger /t REG_SZ /d "" /f 2>/dev/null || true

# Set Adobe Reader to start maximized (fills the virtual desktop window)
wine reg add "HKEY_CURRENT_USER\\Software\\Adobe\\Acrobat Reader\\DC\\AVGeneral" /v bMaximizeAtOpen /t REG_DWORD /d 1 /f 2>/dev/null || true

wineserver -w

echo ""
echo "=================================="
echo "Installation complete!"
echo "=================================="
echo ""
echo "Run Adobe Acrobat Reader DC with: acroread-dc"
echo "Open a PDF file: acroread-dc /path/to/file.pdf"
