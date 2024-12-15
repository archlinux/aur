#/bin/bash
script="$HOME/.local/share/altf5/kwin_script.js"

now=$(date +%T)

num=$(dbus-send --print-reply --dest=org.kde.KWin \
    /Scripting org.kde.kwin.Scripting.loadScript \
    string:"$script" | awk 'END {print $2}')

dbus-send --print-reply --dest=org.kde.KWin /Scripting/Script$num \
    org.kde.kwin.Script.run >/dev/null

dbus-send --print-reply --dest=org.kde.KWin /Scripting/Script$num \
    org.kde.kwin.Script.stop >/dev/null

journalctl _COMM=kwin_wayland -o cat --since "$now" | sed 's/^js: //' | xargs kill -9 
