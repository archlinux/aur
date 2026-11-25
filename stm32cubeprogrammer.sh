#!/bin/sh
set -eu

app=/opt/stm32cubeprog

# X11 launcher
if [ "${1-}" = --default ]; then
  shift
  exec "$app/bin/STM32CubeProgrammer" "$@"
fi

# Find system OpenJFX
javafx_lib=$(find /usr/lib/jvm -maxdepth 3 -type f \
  -name javafx.properties -printf '%h\n' 2>/dev/null | sort -V | tail -n 1)

[ -r "$javafx_lib/javafx.controls.jar" ] || {
  echo "STM32CubeProgrammer: system OpenJFX not found." >&2
  exit 1
}

javafx_major=$(sed -n 's/^javafx.version=//p' "$javafx_lib/javafx.properties")
javafx_major=${javafx_major%%.*}

java_home=$(archlinux-java-run --min "$javafx_major" --java-home)
cd "$app/bin"

exec unshare --user --map-current-user --keep-caps \
  --mount --propagation slave \
  sh -ec '
    java_home=$1
    javafx_lib=$2
    shift 2

    mount -n -o bind,ro "$java_home" /opt/stm32cubeprog/bin/jre

    exec setpriv --inh-caps=-all --ambient-caps=-all \
      /opt/stm32cubeprog/bin/jre/bin/java \
      --enable-native-access=javafx.graphics,ALL-UNNAMED \
      --module-path "$javafx_lib" \
      --add-modules javafx.controls,javafx.fxml,javafx.web,javafx.swing \
      -jar /opt/stm32cubeprog/bin/STM32CubeProgrammerLauncher "$@"
  ' sh "$java_home" "$javafx_lib" "$@"
