#!/bin/bash

PACDATE=""
PACDATE_LIST=""
PACDATE_DEPS=""

# Function to display help/usage information
function show_usage() {
  echo ""
  echo "Usage: $0 <YYYY/MM/DD> <package package2 ...>"
  echo ""
}

# Function to check the input date format is correct
function is_valid_date_format() {
  local regex="^[0-9]{4}/(0[1-9]|1[0-2])/(0[1-9]|[1-2][0-9]|3[0-1])$"

  if [[ $1 =~ $regex ]]; then
    return 0
  else
    return 1
  fi
}

if ! is_valid_date_format "$1"; then
  echo "Date is invalid: $1"
else
  PACDATE=$1
  PACDATE_LIST="${*:2}"
fi

if [ -z $PACDATE ]; then
  echo "No date option provided."
  show_usage
  exit 1
fi

echo "Packages will be updated to the archived version from $PACDATE."
echo " "

if [ -f /etc/pacman.d/mirrorlist.pacdate_backup ]; then
  echo "Mirrorlist already backed up."
else
  echo "Backing up mirrorlist..."
  # Make backup of mirror list
  sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.pacdate_backup
  # Create new mirror list
  sudo sh -c "echo 'Server=https://archive.archlinux.org/repos/$PACDATE/\$repo/os/\$arch' > /etc/pacman.d/mirrorlist"
  echo "Done."
fi

echo " "

if [ -z "$PACDATE_LIST" ]; then
  # Update all
  sudo pacman -Syyuu
else  
  # Update selected packages
  sudo pacman -Syy $PACDATE_LIST
  
  # Create dependency list
  IFS=' ' read -ra PACKAGE_ARRAY <<< "$PACDATE_LIST"
  for CURRENT_PKG in "${PACKAGE_ARRAY[@]}"; do
  PACDATE_DEPS="$PACDATE_DEPS $(pacman -Qi $CURRENT_PKG|grep "Depends On"|cut -d: -f2|awk '{$1=$1};1'|tr -s ' '|tr -d '\n')"
  done
  
  if [ -n "$PACDATE_DEPS" ]; then
    # List dependencies
    echo " "
    echo "The downgraded packages have these dependencies:"
    echo $PACDATE_DEPS
    echo " "
    read -p "Do you want to downgrade these as well? (y/N) " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      $0 "$PACDATE" "$PACDATE_DEPS"
    fi
  fi
fi

if [ -f /etc/pacman.d/mirrorlist.pacdate_backup ]; then
  echo " "
  echo "Restoring mirrorlist from backup..."
  sudo cp /etc/pacman.d/mirrorlist.pacdate_backup /etc/pacman.d/mirrorlist
  sudo rm /etc/pacman.d/mirrorlist.pacdate_backup
  echo "Done."
fi
exit 0
