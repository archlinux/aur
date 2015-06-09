#!/bin/bash

# Reset all of Compiz's settings for the current user

echo "This will reset all of Compiz's settings. Continue only if you know exactly"
echo "what is being done."
echo ""
echo "This program will:"
echo "  1. Switch to the metacity window manager"
echo "  2. Remove Compiz's configuration directories"
echo "  3. Reset Compiz's dconf/GSettings settings"
echo
read -p "Continue (y/N) " PROCEED

if [ "x${PROCEED}" == "xy" ] || [ "x${PROCEED}" == "xY" ]; then
  echo

  echo -n "Switching to the metacity window manager..."
  metacity --replace &>/dev/null &
  echo "DONE"

  echo -n "Waiting for Compiz to exit..."
  while $(pgrep compiz$ &>/dev/null); do
    sleep 0.1
  done
  echo "DONE"

  echo -n "Removing Compiz's configuration directories..."
  rm -rf ~/.compiz/
  rm -rf ~/.compiz-1/
  rm -rf ~/.cache/compizconfig-1/
  rm -rf ~/.config/compiz-1/
  echo "DONE"

  echo -n "Resetting Compiz's dconf/GSettings settings..."
  dconf reset -f /org/compiz/
  echo "DONE"

  echo
  echo "Please log out and log back in. To log out, run:"
  echo "  gnome-session-quit --logout"
  echo ""
  echo "If that fails, try:"
  echo "  killall -s 9 gnome-session"
fi
