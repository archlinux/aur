# Make Plasma scan user-local Qt plugins so the plasma6-applet-quicklaunch copy
# installed into ~/.local/lib/qt6/plugins overrides the bundled kdeplasma-addons
# applet. The packaged staging directory acts as a fallback for accounts that
# have no user-local copy.
export QT_PLUGIN_PATH="$HOME/.local/lib/qt6/plugins:/usr/lib/plasma6-applet-quicklaunch${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}"
