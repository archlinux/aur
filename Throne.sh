#!/bin/sh
# Correctly handle non-standard config directory
confdir=${XDG_CONFIG_HOME:-$HOME/.config}

datadir=$confdir/Throne
appdir=/opt/Throne

# Prepare appdata
if [ ! -d $datadir ]; then
  nekoray_datadir=$confdir/nekoray

  if [ -d $nekoray_datadir ]; then
    # Migrate appdata from nekoray
    cp -a $nekoray_datadir $datadir
  else
    mkdir -p $datadir
  fi
fi

# Create/fix links to existing geo assets
if [ ! -e "$datadir/geoip.db" ] || [ ! -e "$datadir/geosite.db" ]; then
  ln -sf $appdir/geo{ip,site}.db $datadir/
fi

# Run application
$appdir/Throne -- -appdata
