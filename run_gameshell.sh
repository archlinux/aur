#!/bin/bash

# Check if ~/.config/gameshell exists, create it if not
if [ ! -d "~/.config/gameshell" ]; then
  mkdir -p ~/.config/gameshell
fi

# Change into ~/.config/gameshell directory
cd ~/.config/gameshell

# Copy /opt/gameshell/gameshell.sh to ~/.config/gameshell if it does not already exist
if [ ! -f "gameshell.sh" ]; then
  cp /opt/gameshell/gameshell.sh .
fi

# Check if /opt/gameshell/gameshell-save.sh exists, and run it if it does
if [ -f /opt/gameshell/gameshell-save.sh ]; then
  /opt/gameshell/gameshell-save.sh
else
  # Run the copied gameshell.sh script from ~/.config/gameshell
  ./gameshell.sh
fi
