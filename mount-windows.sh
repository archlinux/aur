#!/bin/bash
# Script to manage mounting/unmounting the Windows system partition (C:) from Linux.
# It finds the EFI System Partition (ESP), mounts it if necessary, uses chntpw to read
# the BCD, extracts the partition GUID of the Windows boot (C:), and performs actions
# like mounting read-only (manually or via GUI integration), unmounting, checking status, or showing help.
# Assumes chntpw is installed. For --gui modes, run as regular user (will prompt for sudo if needed for BCD).
# For non-gui modes, run as root or it will relaunch with sudo.
# Usage: ./script.sh mount --gui   OR   sudo ./script.sh [mount|umount|status|help]   OR   ./script.sh umount --gui

# Set strict error handling
set -euo pipefail

# Constants and paths
MNT_POINT="/mnt/windows"
TEMP_MNT="/mnt/temp_efi"
BCD_COPY="/tmp/BCD"

# Common mount points for ESP in dual-boot setups
COMMON_MNTS=("/boot/efi" "/boot" "/efi")

# Usage/help function
usage() {
  cat <<EOF
Usage: $(basename "$0") [mount [--gui]|umount [--gui]|status|help]
Commands:
  mount [--gui]   Mount the Windows system partition read-only
                  --gui: Use udisksctl for GUI integration (auto desktop icon; mounts to /run/media/\$USER/...; run without sudo)
  umount [--gui]  Unmount the Windows partition (requires root for non-gui; run without sudo for --gui)
  status          Show current mount status
  help            Show this help message

Examples:
  $(basename "$0") mount --gui
  sudo $(basename "$0") mount
  $(basename "$0") umount --gui
  sudo $(basename "$0") umount

Notes:
  - For --gui modes, run as regular user (sudo may prompt for BCD access)
  - For non-gui modes, run as root or it will relaunch with sudo prompt
  - Uses chntpw to parse BCD and locate the correct partition
  - Mounts read-only by default at $MNT_POINT (or auto path for --gui)
  - Ensure udisks2 is installed for --gui mode
EOF
  exit 0
}

# Function to relaunch with sudo if needed
relaunch_with_sudo() {
  if [ "$EUID" -ne 0 ]; then
    echo "Relaunching with sudo..."
    exec sudo "$0" "$@"
  fi
}

# Function to check for root DE (true root user, not sudo'd)
is_true_root_de() {
  if [ "$EUID" -eq 0 ] && [ -z "${SUDO_USER:-}" ]; then
    return 0  # True, running as root user (e.g., root DE session)
  fi
  return 1  # False, either non-root or sudo'd from user
}

# Function to find the BCD path (mounts ESP temporarily if needed)
find_bcd_path() {
  local found_bcd=false
  local bcd_path=""

  # Check if BCD is already accessible in common mount points
  for mnt in "${COMMON_MNTS[@]}"; do
    if [ -d "$mnt" ] && [ -f "$mnt/EFI/Microsoft/Boot/BCD" ]; then
      bcd_path="$mnt/EFI/Microsoft/Boot/BCD"
      found_bcd=true
      echo "Found mounted BCD at $bcd_path" >&2
      break
    fi
  done

  # If not found, search for and mount the ESP
  if [ "$found_bcd" = false ]; then
    mkdir -p "$TEMP_MNT"
    local partitions
    partitions=$(sudo blkid -t TYPE="vfat" -o device)
    if [ -z "$partitions" ]; then
      echo "No vfat partitions found." >&2
      exit 1
    fi
    for part in $partitions; do
      if sudo mount -t vfat -o ro "$part" "$TEMP_MNT" 2>/dev/null; then
        if [ -f "$TEMP_MNT/EFI/Microsoft/Boot/BCD" ]; then
          echo "Found ESP: $part" >&2
          sudo cp "$TEMP_MNT/EFI/Microsoft/Boot/BCD" "$BCD_COPY"
          sudo umount "$TEMP_MNT" 2>/dev/null
          bcd_path="$BCD_COPY"
          found_bcd=true
          break
        fi
        sudo umount "$TEMP_MNT" 2>/dev/null
      fi
    done
    if [ "$found_bcd" = false ]; then
      echo "No Windows BCD found on any vfat partition." >&2
      exit 1
    fi
  fi

  echo "$bcd_path"
}

# Function to extract the Windows system PARTUUID from BCD
extract_partuuid() {
  local bcd_path="$1"

  # Extract the default loader GUID from bootmgr
  local bootmgr_guid="{9dea862c-5cdd-4e70-acc1-f32b344d4795}"
  local default_element="24000001"
  local default_output
  default_output=$(sudo chntpw -e "$bcd_path" <<EOF
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
  echo "Default loader GUID: $default_guid" >&2

  # Extract the osdevice binary from the default loader
  local osdevice_element="21000001"
  local osdevice_output
  osdevice_output=$(sudo chntpw -e "$bcd_path" <<EOF
cd \\Objects\\$default_guid\\Elements\\$osdevice_element
cat Element
q
EOF
)
  # Extract the hex data (skip header, concatenate hex values, exclude ASCII dots)
  local hex_data
  hex_data=$(echo "$osdevice_output" | awk '/^:/ {for(i=2; i<NF; i++) printf $i}')
  if [ -z "$hex_data" ]; then
    echo "Failed to extract osdevice hex data." >&2
    exit 1
  fi

  # Offset 0x20 (32 bytes) = char 64 in the hex string, length 32 chars (16 bytes)
  local guid_hex=${hex_data:64:32}
  if [ ${#guid_hex} -ne 32 ]; then
    echo "Invalid GUID hex length." >&2
    exit 1
  fi

  # Convert to lowercase
  guid_hex=$(echo "$guid_hex" | tr 'A-F' 'a-f')

  # Parse the GUID from little-endian groups
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

# Function to perform the mount
do_mount() {
  local use_gui=false
  if [ "${1:-}" = "--gui" ]; then
    use_gui=true
  fi

  # Smart logic for root handling
  if [ "$use_gui" = true ]; then
    if [ "$EUID" -eq 0 ]; then
      if is_true_root_de; then
        echo "Warning: Running GUI mount as true root DE session."
      else
        echo "Error: GUI mount should not be run as root (via sudo). Run as regular user."
        exit 1
      fi
    fi
  else
    relaunch_with_sudo mount "$@"
  fi

  if mountpoint -q "$MNT_POINT" 2>/dev/null; then
    echo "Windows partition already mounted at $MNT_POINT"
    exit 0
  fi

  local bcd_path
  bcd_path=$(find_bcd_path)
  local partuuid
  partuuid=$(extract_partuuid "$bcd_path")
  echo "Windows system partition PARTUUID: $partuuid"

  local device
  device=$(readlink -f "/dev/disk/by-partuuid/$partuuid" 2>/dev/null)
  if [ -z "$device" ] || [ ! -b "$device" ]; then
    echo "No device found for PARTUUID $partuuid"
    exit 1
  fi
  echo "Windows boot partition (C:): $device"

  if [ "$use_gui" = true ]; then
    echo "Mounting via udisksctl for GUI integration..."
    if ! udisksctl mount -b "$device" -o ro,windows_names --filesystem-type=ntfs; then
      echo "Error: Failed to mount $device via udisksctl"
      exit 1
    fi
    local actual_mnt
    actual_mnt=$(udisksctl info -b "$device" | grep MountPoints | awk '{print $2}')
    echo "Mounted at $actual_mnt (GUI icon should appear)"
    # Optional: Symlink to standard MNT_POINT if desired
    mkdir -p "$MNT_POINT"
    ln -s "$actual_mnt"/* "$MNT_POINT/" 2>/dev/null || true
  else
    echo "Mounting Windows partition $device → $MNT_POINT"
    mkdir -p "$MNT_POINT"
    if ! mount -t ntfs-3g -o ro,windows_names "$device" "$MNT_POINT"; then
      echo "Error: Failed to mount $device"
      exit 1
    fi
    echo "Success: Windows partition mounted read-only at $MNT_POINT"
  fi

  # Clean up temp files
  if [ "$bcd_path" = "$BCD_COPY" ]; then
    rm -f "$BCD_COPY" 2>/dev/null
  fi
  rmdir "$TEMP_MNT" 2>/dev/null || true
}

# Function to perform the unmount
do_umount() {
  local use_gui=false
  if [ "${1:-}" = "--gui" ]; then
    use_gui=true
  fi

  # Smart logic for root handling
  if [ "$use_gui" = true ]; then
    if [ "$EUID" -eq 0 ]; then
      if is_true_root_de; then
        echo "Warning: Running GUI unmount as true root DE session."
      else
        echo "Error: GUI unmount should not be run as root (via sudo). Run as regular user."
        exit 1
      fi
    fi
  else
    relaunch_with_sudo umount "$@"
  fi

  local device
  device=$(find_windows_device)  # Need to re-find device for GUI unmount

  if [ "$use_gui" = true ]; then
    if udisksctl info -b "$device" | grep -q "MountPoints: *[^ ]"; then
      echo "Unmounting via udisksctl..."
      udisksctl unmount -b "$device" || { echo "Unmount failed"; exit 1; }
      echo "Done."
    else
      echo "Windows partition not mounted via GUI."
      exit 0
    fi
  else
    if ! mountpoint -q "$MNT_POINT"; then
      echo "Windows partition not mounted."
      exit 0
    fi
    echo "Unmounting $MNT_POINT..."
    umount "$MNT_POINT" || { echo "Unmount failed"; exit 1; }
    rmdir "$MNT_POINT" 2>/dev/null || true
    # Extra cleanup if somehow left
    rm -f "$BCD_COPY" 2>/dev/null
    rmdir "$TEMP_MNT" 2>/dev/null || true
    echo "Done."
  fi
}

# Helper to find device for unmount (reuses logic without full mount)
find_windows_device() {
  local bcd_path
  bcd_path=$(find_bcd_path)
  local partuuid
  partuuid=$(extract_partuuid "$bcd_path")
  local device
  device=$(readlink -f "/dev/disk/by-partuuid/$partuuid" 2>/dev/null)
  if [ -z "$device" ]; then
    echo "Error: Could not find Windows device"
    exit 1
  fi
  echo "$device"
}

# Function to check status
do_status() {
  if mountpoint -q "$MNT_POINT"; then
    echo "Windows partition is mounted at $MNT_POINT"
    mount | grep "$MNT_POINT"
  else
    echo "Windows partition is not mounted."
  fi
}

# Main command dispatcher with optional flags
cmd="${1:-help}"
shift || true
case "$cmd" in
  mount) do_mount "$@" ;;
  umount) do_umount "$@" ;;
  status) do_status ;;
  help|--help|-h) usage ;;
  *) echo "Unknown command: $cmd"; usage ;;
esac