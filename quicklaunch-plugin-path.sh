# Make Plasma load the improved quicklaunch applet (plasma6-applet-quicklaunch)
# from its private plugin directory instead of the bundled kdeplasma-addons copy.
export QT_PLUGIN_PATH="/usr/lib/plasma6-applet-quicklaunch${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}"
