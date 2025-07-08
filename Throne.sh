#!/bin/sh
# Correctly handle non-standard config directory
confdir=${XDG_CONFIG_HOME:-$HOME/.config}

datadir=$confdir/Throne
appdir=/usr/lib/throne

# Prepare appdata
if [ ! -d $datadir ]; then
  nekoray_datadir=$confdir/nekoray

  if [ -d $nekoray_datadir ]; then
    # Migrate appdata from nekoray
    cp -a $nekoray_datadir $datadir
  else
    # Create appdata directory and link to existing geo assets
    mkdir -p $datadir
    ln -s $appdir/geo{ip,site}.db $datadir/
  fi
fi

# Run application
$appdir/Throne -- -appdata
