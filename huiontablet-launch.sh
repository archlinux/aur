#!/bin/bash
script_path="${BASH_SOURCE[0]:-$0}"
script_path="$(readlink -f "$script_path" 2>/dev/null || echo "$script_path")"
appname="$(basename "$script_path")"
appname="${appname%.sh}"
dirname="$(dirname "$script_path")"

LD_LIBRARY_PATH=$dirname/libs
export LD_LIBRARY_PATH

QT_QPA_PLATFORM_PLUGIN_PATH=$dirname/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH

QML2_IMPORT_PATH=$dirname/qml
export QML2_IMPORT_PATH

# Kill existing huionCore (daemon) and huiontablet (GUI) so we can restart cleanly.
# Do not kill ourselves: when run as `huiontablet`, our process name is "huiontablet" too.
self=$$
for pid in $(pgrep -x huionCore 2>/dev/null); do
	kill "$pid" 2>/dev/null || true
done
sleep 1
for pid in $(pgrep -x huiontablet 2>/dev/null); do
	[ "$pid" != "$self" ] && kill "$pid" 2>/dev/null || true
done
sleep 1
# Force kill any that are still running (still exclude self)
for pid in $(pgrep -x huiontablet 2>/dev/null); do
	[ "$pid" != "$self" ] && kill -9 "$pid" 2>/dev/null || true
done
sleep 1

LOG_DIR="${HUION_LOG_DIR:-$HOME/.local/share/huiontablet}"
mkdir -p "$LOG_DIR"

# Run huionCore in background (suppress vendor stdout/stderr spam)
$dirname/huionCore -d >>"$LOG_DIR/huionCore.log" 2>&1 &

# Run huiontablet; redirect stdout and stderr to log so terminal stays clean
$dirname/$appname "$@" -d >>"$LOG_DIR/huiontablet.log" 2>&1
