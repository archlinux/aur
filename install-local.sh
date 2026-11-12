#!/usr/bin/bash
set -euo pipefail

project=$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")
data_home=${XDG_DATA_HOME:-$HOME/.local/share}
runtime=$data_home/quartus-wayland
cache=${XDG_CACHE_HOME:-$HOME/.cache}/quartus-wayland/downloads
bin_home=${QUARTUS_WAYLAND_BIN_HOME:-$HOME/.local/bin}
qt6=${QUARTUS_WAYLAND_QT6_PREFIX:-/opt/qt657-wayland}
[[ -d "$qt6" ]] || qt6=$HOME/qt657/install
jbr_archive=jbr-21.0.8-linux-x64-b1038.68.tar.gz
activation=javax.activation-1.2.0.jar
quartus=${QUARTUS_ROOTDIR:-/opt/intelFPGA/25.1/quartus}
questa=${QUESTA_ROOTDIR:-/opt/intelFPGA/25.1/questa_fse}
if [[ ! -x "$quartus/bin/quartus_sh" ]]; then
    printf 'Quartus installation missing: %s\nSet QUARTUS_ROOTDIR before running setup.\n' "$quartus" >&2
    exit 1
fi

if [[ ! -r "$qt6/plugins/platforms/libqwayland-generic.so" || ! -r "$qt6/plugins/wayland-shell-integration/libxdg-shell.so" ]]; then
    printf 'Qt 6.5.7 Wayland runtime missing: %s\nSet QUARTUS_WAYLAND_QT6_PREFIX to the compiled Qt prefix.\n' "$qt6" >&2
    exit 1
fi
mkdir -p "$cache" "$runtime/lib" "$runtime/java/bin" "$bin_home" "$data_home/applications"

download() {
    local name=$1 checksum=$2 url=$3
    if [[ ! -f "$cache/$name" ]]; then
        curl --fail --location --retry 2 --output "$cache/$name.part" "$url"
        mv -- "$cache/$name.part" "$cache/$name"
    fi
    printf '%s  %s\n' "$checksum" "$cache/$name" | sha256sum --check --status
}

if [[ -n ${QUARTUS_WAYLAND_JAVA_HOME:-} ]]; then
    java_home=$QUARTUS_WAYLAND_JAVA_HOME
elif [[ -r /opt/quartus-wayland/jbr/lib/libawt_wlawt.so ]]; then
    java_home=/opt/quartus-wayland/jbr
else
    java_home=$runtime/jbr
    if [[ ! -r "$java_home/lib/libawt_wlawt.so" ]]; then
        download "$jbr_archive" ad3dcf0e8df0a63299ecdf303658db2f4565413b175796c5743203047b9887eb \
            "https://cache-redirector.jetbrains.com/intellij-jbr/$jbr_archive"
        mkdir -p "$java_home"
        tar -xzf "$cache/$jbr_archive" --strip-components=1 -C "$java_home"
    fi
fi
[[ -x "$java_home/bin/java" && -r "$java_home/lib/libawt_wlawt.so" ]] || {
    printf 'Java runtime must include WLToolkit: %s\n' "$java_home" >&2; exit 1;
}
if [[ -r /opt/quartus-wayland/lib/$activation ]]; then
    install -m644 "/opt/quartus-wayland/lib/$activation" "$runtime/lib/$activation"
else
    download "$activation" 993302b16cd7056f21e779cc577d175a810bb4900ef73cd8fbf2b50f928ba9ce \
        "https://repo.maven.apache.org/maven2/com/sun/activation/javax.activation/1.2.0/$activation"
    install -m644 "$cache/$activation" "$runtime/lib/$activation"
fi
install -m755 "$project/java-wayland" "$runtime/java/bin/java"

# Copy the runtime subset so desktop entries remain usable after build cleanup.
if [[ $(realpath -m "$qt6") != $(realpath -m "$runtime/qt6") ]]; then
    mkdir -p "$runtime/qt6/lib" "$runtime/qt6/plugins/platforms"
    for library in "$qt6"/lib/libQt6WaylandClient.so* "$qt6"/lib/libQt6WaylandEglClientHwIntegration.so* "$qt6"/lib/libQt6DBus.so*; do
        [[ ! -e "$library" ]] || cp -a "$library" "$runtime/qt6/lib/"
    done
    install -m755 "$qt6/plugins/platforms/libqwayland-generic.so" "$runtime/qt6/plugins/platforms/"
    for category in wayland-shell-integration wayland-decoration-client; do
        [[ ! -d "$qt6/plugins/$category" ]] || cp -a "$qt6/plugins/$category" "$runtime/qt6/plugins/"
    done
fi
install -m755 "$project/quartus-wayland" "$bin_home/quartus-wayland"
install -m755 "$project/questa-hidpi" "$bin_home/questa-hidpi"
install -m644 "$project/questa-hidpi.tcl" "$runtime/questa-hidpi.tcl"
install -m644 "$project/configure-quartus.tcl" "$runtime/configure-quartus.tcl"
ln -sfn quartus-wayland "$bin_home/qmegawiz-wayland"
ln -sfn quartus-wayland "$bin_home/qsys-edit-wayland"

config_dir=${XDG_CONFIG_HOME:-$HOME/.config}/quartus-wayland
mkdir -p "$config_dir"
if [[ -f "$config_dir/config" ]]; then
    cp -a "$config_dir/config" "$config_dir/config.bak"
fi
{
    printf '[[ -n ${QUARTUS_ROOTDIR:-} ]] || QUARTUS_ROOTDIR=%q\n' "$quartus"
    printf 'QUARTUS_WAYLAND_HOME=%q\n' "$runtime"
    printf '[[ -n ${QUARTUS_WAYLAND_QT6_PREFIX:-} ]] || QUARTUS_WAYLAND_QT6_PREFIX=%q\n' "$runtime/qt6"
    printf '[[ -n ${QUARTUS_WAYLAND_JAVA_HOME:-} ]] || QUARTUS_WAYLAND_JAVA_HOME=%q\n' "$java_home"
    printf '[[ -n ${QUESTA_ROOTDIR:-} ]] || QUESTA_ROOTDIR=%q\n' "$questa"
    printf 'export QUARTUS_WAYLAND_HOME QUARTUS_WAYLAND_QT6_PREFIX QUARTUS_WAYLAND_JAVA_HOME\n'
} > "$config_dir/config"

python3 - "$project" "$data_home/applications" "$bin_home" "$quartus" "$questa" <<'PY'
from pathlib import Path
import sys
project, applications, binaries, quartus, questa = sys.argv[1:]
for name in ('quartus-wayland', 'qmegawiz-wayland', 'qsys-edit-wayland', 'questa-hidpi'):
    lines = []
    for line in (Path(project) / (name + '.desktop')).read_text().splitlines():
        if line.startswith('Exec='):
            command, *arguments = line[5:].split(' ', 1)
            path = str(Path(binaries) / command)
            path = path.replace('\\', '\\\\').replace('"', '\\"').replace('`', '\\`').replace('$', '\\$').replace('%', '%%')
            line = 'Exec="' + path + '"' + (' ' + arguments[0] if arguments else '')
        elif line.startswith('TryExec='):
            line = 'TryExec=' + str(Path(binaries) / line[8:])
        elif line.startswith('Icon='):
            if name == 'questa-hidpi':
                line = 'Icon=' + str(Path(questa) / 'questa.gif')
            else:
                line = 'Icon=' + str(Path(quartus) / 'adm/quartusii.png')
        lines.append(line)
    (Path(applications) / (name + '.desktop')).write_text('\n'.join(lines) + '\n')
PY

# The simulator reads this hook before constructing its GUI. Keep personal
# preferences, adding only an opt-in hook for sessions started by our launcher.
python3 - "$runtime" <<'PY'
from pathlib import Path
import shutil, sys
runtime = Path(sys.argv[1])
preferences = Path.home() / 'modelsim.tcl'
text = preferences.read_text() if preferences.exists() else ''
marker = '# Quartus Wayland: per-session Questa display settings'
if marker not in text:
    if preferences.exists():
        backup = preferences.with_name('modelsim.tcl.before-quartus-wayland')
        if not backup.exists():
            shutil.copy2(preferences, backup)
    preferences.write_text(text + '\n' + marker + '\n'
        'if {[info exists ::env(QUESTA_HIDPI_TCL)]} {\n'
        '    source $::env(QUESTA_HIDPI_TCL)\n}\n')
PY

if [[ -d "$questa/bin" ]]; then
    mkdir -p "$runtime/questa/bin"
    for entry in "$questa"/*; do
        [[ ${entry##*/} == bin ]] || ln -sfn "$entry" "$runtime/questa/${entry##*/}"
    done
    for command in "$questa"/bin/*; do
        [[ ${command##*/} == vsim ]] || ln -sfn "$command" "$runtime/questa/bin/${command##*/}"
    done
    ln -sfn "$bin_home/questa-hidpi" "$runtime/questa/bin/vsim"
    "$quartus/bin/quartus_sh" -t "$runtime/configure-quartus.tcl" "$runtime/questa/bin"
fi
if command -v update-desktop-database >/dev/null; then
    update-desktop-database "$data_home/applications"
fi
printf 'Installed Quartus/IP Wayland and Questa HiDPI entries.\nQt runtime: %s\nJava runtime: %s\nQuesta relay: %s\n' "$runtime/qt6" "$java_home" "$runtime/questa/bin"
