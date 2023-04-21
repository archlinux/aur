#!/bin/bash
APPDIR=

while IFS='=' read -r key value; do
  case $key in
    app.classpath) app_classpath=$value ;;
    app.mainclass) app_mainclass=$value ;;
    java-options) java_options+=("$value") ;;
  esac
done < "$APPDIR/misc/AudioRelay.cfg"

archlinux-java-run -a 17 -- "${java_options[*]}" \
    -Djava.library.path=$APPDIR/misc \
    -cp "$(eval echo "$app_classpath")" "$app_mainclass"
