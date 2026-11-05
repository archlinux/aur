#!/bin/sh
confdir=${XDG_CONFIG_HOME:-$HOME/.config}
datadir=$confdir/Throne
appdir=/opt/Throne

# Remove broken (since 1.0.2-beta.1) links to geo assets
if [ -L $datadir/geoip.db ] || [ -L $datadir/geosite.db ]; then
  rm -f $datadir/geo{ip,site}.db
fi

# Starting with version 1.1.0, app uses SQLite for configs, backup old json configs
if [ -f $datadir/config/configs.json ] && [ ! -f $datadir/config/throne.db ]; then
  mv $datadir/config $datadir/config_old
fi

$appdir/Throne -appdata "$@"
