#!/bin/sh
APP_LOCAL_DIR=$HOME/.heli-x
APP_EXECUTABLE=/usr/share/heli-x/runHELI-X.sh
APP_VERSION=$(pacman -Qi heli-x | grep 'Version' | awk '{print $3}')

# function to copy all resources to the local config directory and create a file which holds the current package version
copy_resources () {
  cp -R --preserve=timestamps /usr/share/heli-x/resources $APP_LOCAL_DIR/
  touch $APP_LOCAL_DIR/resources/$APP_VERSION
}

# create the local config directory if it does not exist
mkdir -p $APP_LOCAL_DIR

# copy all resources if they are not present in the local config directory
if [ ! -d $APP_LOCAL_DIR/resources ]; then
  copy_resources
else
  # backup old resources if they are present from another package version and then copy the current ones
  if [ ! -f $APP_LOCAL_DIR/resources/$APP_VERSION ]; then
    rm -rf $APP_LOCAL_DIR/resources.bak
    mv $APP_LOCAL_DIR/resources $APP_LOCAL_DIR/resources.bak
    copy_resources
  fi
fi

# execute the heli-x application or server script
if [ "$1" == "server" ]; then
  APP_EXECUTABLE=${APP_EXECUTABLE/.sh/-Server.sh}
fi
exec $APP_EXECUTABLE
