#!/bin/bash
# Script to manage mounting/unmounting the Windows system partition (C:) from Linux.

set -euo pipefail

# Constants and paths
CANONICAL_LINK="/run/windows"
TEMP_MNT="/mnt/temp_efi"
BCD_COPY="/tmp/BCD"
COMMON_ESP_MOUNTS=("/boot/efi" "/boot" "/efi")
POLKIT_RULES="/usr/share/polkit-1/rules.d/49-mount-windows.rules"
MAPPER_NAME="mount-windows-c" # fixed mapper for BitLocker

# Elevation
needs_root() {
    case "${1:-}" in
        mount)
            [[ "${2:-}" != "--gui" ]] && return 0 || return 1 ;;
        umount|install-polkit|uninstall-polkit)
            return 0 ;;
        status|help|--help|-h)
            return 1 ;;
        *)
            return 0
    esac
}

if [ "$EUID" -ne 0 ] && needs_root "$@"; then
    if command -v pkexec >/dev/null 2>&1 && [ -f "$POLKIT_RULES" ]; then
        exec pkexec "$0" "$@"
    else
        exec sudo "$0" "$@"
    fi
fi

# WSL support
is_wsl() {
    if [[ "$(uname -r)" == *microsoft* ]] || grep -qi microsoft /proc/version 2>/dev/null || \
       [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
        return 0
    fi
    return 1
}

detect_wsl_c_drive() {
    if is_wsl && [ -d "/mnt/c/Windows" ] && mountpoint -q "/mnt/c" 2>/dev/null; then
        echo "/mnt/c"
        return 0
    fi
    return 1
}

# Polkit
install_polkit() {
    [ "$EUID" -ne 0 ] && { echo "Error: install-polkit must be run as root" >&2; exit 1; }

    cat > "$POLKIT_RULES" <<'EOF'

polkit.addRule(function(action, subject) {
    if (action.id === "org.freedesktop.policykit.exec" &&
        action.lookup("program") === "/usr/bin/mount-windows" &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});

polkit.addRule(function(action, subject) {
    if ((action.id === "org.freedesktop.udisks2.filesystem-mount" ||
         action.id === "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id === "org.freedesktop.udisks2.filesystem-unmount" ||
         action.id === "org.freedesktop.udisks2.filesystem-unmount-system") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
EOF

    chmod 644 "$POLKIT_RULES"
    echo "✓ Polkit rules installed at $POLKIT_RULES"
    echo "   Wheel group members can now run the script passwordlessly."
}

uninstall_polkit() {
    [ "$EUID" -ne 0 ] && { echo "Error: uninstall-polkit must be run as root" >&2; exit 1; }
    if [ -f "$POLKIT_RULES" ]; then
        rm -f "$POLKIT_RULES"
        echo "✓ Polkit rules removed."
    else
        echo "No Polkit rules found."
    fi
}

# Help
usage() {
    cat <<EOF
Usage: $(basename "$0") [mount [--gui] | umount | status | install-polkit | uninstall-polkit | help]

Commands:
  mount [--gui]          Mount Windows C: read-only (always available at /run/windows)
  umount                 Unmount (closes BitLocker mapper if used)
  status                 Show status of /run/windows
  install-polkit         Install Polkit rules (wheel group only) – run as root
  uninstall-polkit       Remove Polkit rules – run as root
  help                   This help

After install-polkit, wheel-group users can run the script directly (no sudo/pkexec prompt).
EOF
    exit 0
}

# Utility functions
run_sudo() {
    [ "$EUID" -eq 0 ] && "$@" || sudo "$@"
}

is_bitlocker() {
    local dev="$1"
    local type
    type=$(blkid -o value -s TYPE "$dev" 2>/dev/null || echo "")
    [[ "$type" =~ [Bb]it[Ll]ocker ]]
}

# Device discovery
find_bcd_path() {
    local bcd_path=""
    for mnt in "${COMMON_ESP_MOUNTS[@]}"; do
        if [ -f "$mnt/EFI/Microsoft/Boot/BCD" ]; then
            bcd_path="$mnt/EFI/Microsoft/Boot/BCD"
            break
        fi
    done
    if [ -z "$bcd_path" ]; then
        run_sudo mkdir -p "$TEMP_MNT"
        local esp_parts
        esp_parts=$(run_sudo blkid -t TYPE=vfat -o device)
        for part in $esp_parts; do
            if run_sudo mount -t vfat -o ro "$part" "$TEMP_MNT" 2>/dev/null; then
                if [ -f "$TEMP_MNT/EFI/Microsoft/Boot/BCD" ]; then
                    run_sudo cp "$TEMP_MNT/EFI/Microsoft/Boot/BCD" "$BCD_COPY"
                    run_sudo umount "$TEMP_MNT" 2>/dev/null || true
                    bcd_path="$BCD_COPY"
                    break
                fi
                run_sudo umount "$TEMP_MNT" 2>/dev/null || true
            fi
        done

        # Cleanup mountpoints
        run_sudo umount "$TEMP_MNT" 2>/dev/null || true
        rmdir "$TEMP_MNT" 2>/dev/null || true
    fi

    if [ -z "$bcd_path" ]; then
        rm -f "$BCD_COPY" 2>/dev/null || true
        echo "Error: Could not locate Windows BCD" >&2
        exit 1
    fi
    echo "$bcd_path"
}

extract_partuuid() {
    local bcd_path="$1"
    local bootmgr_guid="{9dea862c-5cdd-4e70-acc1-f32b344d4795}"
    local default_element="24000001"
    local default_output
    default_output=$(run_sudo chntpw -e "$bcd_path" <<EOF
cd \\Objects\\$bootmgr_guid\\Elements\\$default_element
cat Element
q
EOF
)
    local default_guid
    default_guid=$(echo "$default_output" | grep -A1 "<Element>" | tail -1 | sed 's/.*: *//' | tr -d ' ')
    if [ -z "$default_guid" ]; then
        echo "Failed to extract default GUID." >&2
        exit 1
    fi
    local osdevice_element="21000001"
    local osdevice_output
    osdevice_output=$(run_sudo chntpw -e "$bcd_path" <<EOF
cd \\Objects\\$default_guid\\Elements\\$osdevice_element
cat Element
q
EOF
)
    local hex_data
    hex_data=$(echo "$osdevice_output" | awk '/^:/ {for(i=2; i<NF; i++) printf $i}')
    if [ -z "$hex_data" ]; then
        echo "Failed to extract osdevice hex data." >&2
        exit 1
    fi
    local guid_hex=${hex_data:64:32}
    guid_hex=$(echo "$guid_hex" | tr 'A-F' 'a-f')
    local b0=${guid_hex:0:2}
    local b1=${guid_hex:2:2}
    local b2=${guid_hex:4:2}
    local b3=${guid_hex:6:2}
    local b4=${guid_hex:8:2}
    local b5=${guid_hex:10:2}
    local b6=${guid_hex:12:2}
    local b7=${guid_hex:14:2}
    local b8=${guid_hex:16:2}
    local b9=${guid_hex:18:2}
    local b10=${guid_hex:20:2}
    local b11=${guid_hex:22:2}
    local b12=${guid_hex:24:2}
    local b13=${guid_hex:26:2}
    local b14=${guid_hex:28:2}
    local b15=${guid_hex:30:2}
    local part_guid
    part_guid=$(printf "%s%s%s%s-%s%s-%s%s-%s%s-%s%s%s%s%s%s" \
        $b3 $b2 $b1 $b0 \
        $b5 $b4 \
        $b7 $b6 \
        $b8 $b9 \
        $b10 $b11 $b12 $b13 $b14 $b15)
    echo "$part_guid"
}

get_windows_device() {
    local bcd_path
    bcd_path=$(find_bcd_path)
    local partuuid
    partuuid=$(extract_partuuid "$bcd_path")
    readlink -f "/dev/disk/by-partuuid/$partuuid" 2>/dev/null || echo "/dev/disk/by-partuuid/$partuuid"
}

# Mount helpers
find_existing_mount() {
    local device="$1"
    local mount_source="${2:-$device}"
    local mp=""

    # Check canonical symlink first
    if [ -L "$CANONICAL_LINK" ]; then
        mp=$(readlink -f "$CANONICAL_LINK" 2>/dev/null)
        mountpoint -q "$mp" 2>/dev/null && { echo "$mp"; return 0; }
    elif mountpoint -q "$CANONICAL_LINK" 2>/dev/null; then
        echo "$CANONICAL_LINK"
        return 0
    fi

    # Check physical device
    mp=$(findmnt -n -o TARGET --source "$device" 2>/dev/null | head -n1)
    [ -n "$mp" ] && mountpoint -q "$mp" 2>/dev/null && { echo "$mp"; return 0; }

    # Check actual mount source
    if [ "$mount_source" != "$device" ]; then
        mp=$(findmnt -n -o TARGET --source "$mount_source" 2>/dev/null | head -n1)
        [ -n "$mp" ] && mountpoint -q "$mp" 2>/dev/null && { echo "$mp"; return 0; }
    fi

    echo ""
}

create_link() {
    local real="$1"
    [ -z "$real" ] || [ ! -d "$real" ] && { echo "Error: Could not find real Windows mount point" >&2; return 1; }

    if [ "$(readlink -f "$CANONICAL_LINK" 2>/dev/null)" = "$(readlink -f "$real")" ]; then
        echo "Windows already available at $CANONICAL_LINK"
        return 0
    fi

    echo "Creating symlink: $CANONICAL_LINK → $real"
    run_sudo unlink "$CANONICAL_LINK" 2>/dev/null || true
    run_sudo mkdir -p "$(dirname "$CANONICAL_LINK")"
    run_sudo ln -sfn "$real" "$CANONICAL_LINK"
}

# Mount
do_mount() {
    local use_gui=false
    [[ "${1:-}" == "--gui" ]] && use_gui=true

    # Do not allow gui mode to be run via sudo but do allow it if the DE is actually running as root
    if [ "$use_gui" = true ] && [ "$EUID" -eq 0 ] && \
       { [ -n "${SUDO_USER:-}" ] || [ -n "${PKEXEC_UID:-}" ]; }; then
        cat >&2 <<EOF
Error: GUI mode (--gui) cannot be run via sudo or pkexec.

The desktop environment expects mounts to be performed by your normal user
for icons to appear on your desktop correctly.

Please run without sudo/pkexec:
    $(basename "$0") mount --gui
EOF
        exit 1
    fi

    # WSL fast path
    local wsl_mount
    if wsl_mount=$(detect_wsl_c_drive); then
        echo "WSL detected — using built-in Windows C: at $wsl_mount"
        create_link "$wsl_mount"
        exit 0
    fi

    local device
    device=$(get_windows_device)

    local mount_source="$device"
    local is_bl=false

    if is_bitlocker "$device"; then
        is_bl=true
        echo "BitLocker detected on Windows partition."
        echo "You will be prompted for your BitLocker password (or recovery key)."

        if [ "$use_gui" = true ]; then
            echo "→ Unlocking using udisksctl (GUI password/recovery-key dialog)..."
            if udisksctl info -b "$device" | grep -q "CleartextDevice:"; then
                mount_source=$(udisksctl info -b "$device" | grep "CleartextDevice:" | awk '{print $2}')
                echo "Already unlocked as $mount_source"
            else
                local unlock_output
                unlock_output=$(udisksctl unlock -b "$device" 2>&1)
                mount_source=$(echo "$unlock_output" | grep -o "/dev/dm-[0-9]\+" | head -n1)
                [ -z "$mount_source" ] && { echo "Failed to unlock BitLocker." >&2; exit 1; }
                echo "Unlocked as $mount_source"
            fi
        else
            if [ -e "/dev/mapper/$MAPPER_NAME" ]; then
                echo "Already unlocked (using existing mapper)."
            else
                echo "Unlocking with cryptsetup..."
                run_sudo cryptsetup open --type bitlk --readonly "$device" "$MAPPER_NAME"
            fi
            mount_source="/dev/mapper/$MAPPER_NAME"
        fi
    fi

    local existing
    existing=$(find_existing_mount "$device" "$mount_source")

    if [ -n "$existing" ]; then
        if [ "$use_gui" = true ] && [[ "$existing" != /run/media/* ]] && [[ "$existing" != /media/* ]]; then
            echo "Existing direct mount detected — remounting via udisksctl for proper GUI/desktop integration..."
            do_umount # clean unmount first
        else
            echo "Windows partition already mounted at: $existing"
            create_link "$existing"
            exit 0
        fi
    fi

    if [ "$use_gui" = true ]; then
        echo "Mounting via udisksctl (GUI integration)..."
        udisksctl mount -b "$mount_source" -o ro,windows_names || exit 1
        sleep 0.8
        existing=$(find_existing_mount "$device" "$mount_source")
        create_link "$existing"
    else
        echo "Mounting directly to $CANONICAL_LINK..."
        run_sudo mkdir -p "$CANONICAL_LINK"
        run_sudo mount -t ntfs-3g -o ro,windows_names "$mount_source" "$CANONICAL_LINK"
        echo "Mounted successfully at $CANONICAL_LINK"
    fi
}

# Umount
do_umount() {
    if is_wsl; then
        run_sudo unlink "$CANONICAL_LINK" 2>/dev/null || true
        exit 0
    fi

    local device
    device=$(get_windows_device)
    local existing
    existing=$(find_existing_mount "$device")

    if [ -z "$existing" ]; then
        echo "Windows partition not mounted."
        run_sudo unlink "$CANONICAL_LINK" 2>/dev/null || true
        exit 0
    fi

    echo "Unmounting Windows partition..."

    if [[ "$existing" == /run/media/* ]] || [[ "$existing" == /media/* ]]; then
        udisksctl unmount -b "$device" || true
        run_sudo rmdir "$existing" 2>/dev/null || true
    elif mountpoint -q "$CANONICAL_LINK"; then
        run_sudo umount "$CANONICAL_LINK" || true
        run_sudo rmdir "$CANONICAL_LINK" 2>/dev/null || true
    fi

    if [ -e "/dev/mapper/$MAPPER_NAME" ]; then
        echo "Closing BitLocker mapper..."
        run_sudo cryptsetup close "$MAPPER_NAME" || true
    fi

    run_sudo unlink "$CANONICAL_LINK" 2>/dev/null || true
    echo "Done. Windows fully unmounted."
}

# Status
do_status() {
    if [ -L "$CANONICAL_LINK" ]; then
        local target
        target=$(readlink -f "$CANONICAL_LINK")
        echo "Windows C: available via symlink"
        echo " $CANONICAL_LINK → $target"
        if is_wsl; then
            echo " (WSL automatic mount)"
        fi
        mount | grep -E "(^| )$target( |,)" || true
    elif mountpoint -q "$CANONICAL_LINK"; then
        echo "Windows C: mounted directly at $CANONICAL_LINK"
        mount | grep "$CANONICAL_LINK"
    else
        echo "Windows partition not available at $CANONICAL_LINK"
    fi
}

# Main
case "${1:-help}" in
    mount) do_mount "${2:-}" ;;
    umount) do_umount ;;
    status) do_status ;;
    install-polkit) install_polkit ;;
    uninstall-polkit) uninstall_polkit ;;
    help|--help|-h) usage ;;
    *) echo "Unknown command: $1"; usage ;;
esac
