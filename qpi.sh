export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION=brcm

# Required as of 5.7.0 beta/RC
export QSG_RENDER_LOOP=basic

PATH="localpiprefix/bin:${PATH}"
export PATH
