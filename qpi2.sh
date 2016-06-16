export QT_QPA_PLATFORM=wayland
export QT_IM_MODULE=qtvirtualkeyboard
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

#Still a little raw
#export QT_WAYLAND_USE_XDG_SHELL=1

# Required as of 5.7.0 beta/RC
export QSG_RENDER_LOOP=basic

PATH="localpiprefix/bin:${PATH}"
export PATH
