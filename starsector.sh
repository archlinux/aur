#!/usr/bin/env bash

set -euo pipefail

# fix for users of special IM modules
unset XMODIFIERS GTK_IM_MODULE QT_IM_MODULE

state_dir="${XDG_DATA_HOME:-"$HOME/.local/share"}/starsector"
saves_path="${state_dir}/saves"
mods_path="${state_dir}/mods"
screenshots_path="${state_dir}/screenshots"
log_path="$state_dir"

mkdir -p "$saves_path"
mkdir -p "$mods_path"
mkdir -p "$screenshots_path"
mkdir -p "$log_path"

classpath="$(find '/usr/share/java/starsector' -type f -name '*.jar' | paste -sd ':')"

config_path="${XDG_CONFIG_HOME:-"$HOME/.config"}/starsector"
startup_config="${config_path}/startup.sh"

jvm_args=(-XX:+UseG1GC -Xms1536m -Xmx1536m -Xss2048k -XX:PermSize=192m -XX:MaxPermSize=192m)
program_args=()

if [ -r "$startup_config" ]
then
    . "$startup_config"
fi

export JAVA_HOME='/usr/lib/starsector/jre'
cd /usr/share/starsector
exec "$JAVA_HOME/bin/java" -server \
  -XX:CompilerThreadPriority=1 \
  -XX:+CompilerThreadHintNoPreempt \
  -Djava.library.path=/usr/lib/starsector \
  -classpath "${classpath}" \
  -Dcom.fs.starfarer.settings.paths.saves="${saves_path}" \
  -Dcom.fs.starfarer.settings.paths.screenshots="${screenshots_path}" \
  -Dcom.fs.starfarer.settings.paths.mods="${mods_path}" \
  -Dcom.fs.starfarer.settings.paths.logs="${log_path}" \
  -Dcom.fs.starfarer.settings.linux=true \
  "${jvm_args[@]}" \
  com.fs.starfarer.StarfarerLauncher \
  "${program_args[@]}"

