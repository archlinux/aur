#!/bin/bash
# Adobe Acrobat Reader DC setup script for Arch Linux

set -euo pipefail

APPDIR="/opt/acroread-dc-wine"
WINEPREFIX="${HOME}/.local/share/acroread-dc-wine"
TMPDIR="${TMPDIR:-/tmp}"
INSTALLER="$(find "$APPDIR" -maxdepth 1 -type f -name 'AcroRdrDCx64*.exe' -print -quit)"
MSPATCHA_X64="$APPDIR/mspatcha-x64.dll"
MSPATCHA_X86="$APPDIR/mspatcha-x86.dll"

export WINEPREFIX
export WINEARCH="win64"
export WINEDEBUG="-all"

if [[ -z "$INSTALLER" ]]; then
    echo "Error: Adobe Acrobat Reader installer is missing from $APPDIR." >&2
    exit 1
fi

if [[ ! -f "$MSPATCHA_X64" || ! -f "$MSPATCHA_X86" ]]; then
    echo "Error: the packaged mspatcha DLLs are missing from $APPDIR." >&2
    exit 1
fi

INSTALLER_ID="${INSTALLER##*/}"
STATE_FILE="$WINEPREFIX/.acroread-dc-wine-installer"

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
WINETRICKS_LOG="$WINEPREFIX/acroread-dc-winetricks.log"
if ! winetricks --unattended win10 riched20 vcrun2015 \
    > "$WINETRICKS_LOG" 2>&1; then
    echo "Error: winetricks failed. See $WINETRICKS_LOG." >&2
    tail -n 40 "$WINETRICKS_LOG" >&2 || true
    exit 1
fi
wineserver -w

# Wine's built-in mspatcha cannot decode every PA19 stream used by current
# Adobe updates.  Install the source-built, multi-architecture implementation.
install -m644 "$MSPATCHA_X64" \
    "$WINEPREFIX/drive_c/windows/system32/mspatcha.dll"
install -m644 "$MSPATCHA_X86" \
    "$WINEPREFIX/drive_c/windows/syswow64/mspatcha.dll"
export WINEDLLOVERRIDES="mspatcha=n,b"

# Link system fonts
echo "[3/5] Linking system fonts..."
FONTS_DIR="$WINEPREFIX/drive_c/windows/Fonts"
mkdir -p "$FONTS_DIR"
find /usr/share/fonts -type f \( -name "*.ttf" -o -name "*.ttc" -o -name "*.otf" \) -exec ln -sf {} "$FONTS_DIR/" \; 2>/dev/null || true

# Extract and install Adobe Reader
echo "[4/5] Installing Adobe Acrobat Reader DC..."
EXTRACT_DIR="$(mktemp -d "${TMPDIR%/}/acroread-dc-extract.XXXXXXXX")"
DRIVE_LINK=""

cleanup_installer() {
    if [[ -n "$DRIVE_LINK" ]]; then
        rm -f -- "$DRIVE_LINK"
    fi
    if [[ -n "$EXTRACT_DIR" ]]; then
        rm -rf -- "$EXTRACT_DIR"
    fi
}
trap cleanup_installer EXIT

7z x "$INSTALLER" -o"$EXTRACT_DIR" -y > /dev/null 2>&1

MSI="$EXTRACT_DIR/AcroPro.msi"
if [[ ! -f "$MSI" ]]; then
    echo "Error: Could not find AcroPro.msi in the extracted installer." >&2
    exit 1
fi
MSP="$(find "$EXTRACT_DIR" -maxdepth 1 -type f \
    -name 'AcroRdrDCx64Upd*.msp' -print -quit)"
if [[ -z "$MSP" ]]; then
    echo "Error: Could not find the Adobe update MSP." >&2
    exit 1
fi

DRIVE_LETTER=""
for candidate in s r q p o n; do
    candidate_link="$WINEPREFIX/dosdevices/${candidate}:"
    if [[ ! -e "$candidate_link" && ! -L "$candidate_link" ]]; then
        ln -s "$EXTRACT_DIR" "$candidate_link"
        DRIVE_LETTER="$candidate"
        DRIVE_LINK="$candidate_link"
        break
    fi
done
if [[ -z "$DRIVE_LETTER" ]]; then
    echo "Error: no free Wine drive letter is available for installation." >&2
    exit 1
fi

WINDOWS_DRIVE="${DRIVE_LETTER^^}:"
INSTALL_LOG="$WINEPREFIX/drive_c/acroread-dc-install.log"
if ! wine msiexec \
    /i "${WINDOWS_DRIVE}\\AcroPro.msi" \
    /qn '/l*v' 'C:\acroread-dc-install.log' \
    "PATCH=${WINDOWS_DRIVE}\\${MSP##*/}" \
    EULA_ACCEPT=YES \
    SUPPRESS_APP_LAUNCH=YES \
    DISABLE_BROWSER_INTEGRATION=YES \
    INSTALLPDFPRINTER=0 \
    DISABLEDESKTOPSHORTCUT=1; then
    wineserver -w || true
    echo "Error: Adobe Reader installation failed. See $INSTALL_LOG." >&2
    exit 1
fi
wineserver -w

cleanup_installer
EXTRACT_DIR=""
DRIVE_LINK=""
trap - EXIT

# Apply registry tweaks
echo "[5/5] Applying configuration..."
if [[ -f "$APPDIR/acroread-dc.reg" ]]; then
    wine regedit "$APPDIR/acroread-dc.reg" 2>/dev/null || true
    wineserver -w
fi

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

    for READER_DIR in \
        "$PROG_FILES/Adobe/Acrobat DC/Acrobat" \
        "$PROG_FILES/Adobe/Acrobat Reader DC/Reader"; do
        if [[ ! -d "$READER_DIR" ]]; then
            continue
        fi
        if [[ -f "$READER_DIR/AdobeCollabSync.exe" ]]; then
            mv "$READER_DIR/AdobeCollabSync.exe" \
                "$READER_DIR/AdobeCollabSync.exe_disabled" 2>/dev/null || true
        fi
        if [[ -d "$READER_DIR/AcroCEF" ]]; then
            if [[ -f "$READER_DIR/AcroCEF/RdrServicesUpdater.exe" ]]; then
                mv "$READER_DIR/AcroCEF/RdrServicesUpdater.exe" \
                    "$READER_DIR/AcroCEF/RdrServicesUpdater.exe_disabled" 2>/dev/null || true
            fi
        fi
    done
done

# Disable Wine debugger popup
wine reg add "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug" /v Debugger /t REG_SZ /d "" /f 2>/dev/null || true
wine reg add "HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug" /v Debugger /t REG_SZ /d "" /f 2>/dev/null || true

# Set Adobe Reader to start maximized (fills the virtual desktop window)
wine reg add "HKEY_CURRENT_USER\\Software\\Adobe\\Adobe Acrobat\\DC\\AVGeneral" /v bMaximizeAtOpen /t REG_DWORD /d 1 /f 2>/dev/null || true

wineserver -w

READER_EXE="$WINEPREFIX/drive_c/Program Files/Adobe/Acrobat DC/Acrobat/Acrobat.exe"
if [[ ! -f "$READER_EXE" ]]; then
    echo "Error: Acrobat.exe was not installed at the expected 64-bit path." >&2
    exit 1
fi

printf '%s\n' "$INSTALLER_ID" > "$STATE_FILE"

echo ""
echo "=================================="
echo "Installation complete!"
echo "=================================="
echo ""
echo "Run Adobe Acrobat Reader DC with: acroread-dc"
echo "Open a PDF file: acroread-dc /path/to/file.pdf"
