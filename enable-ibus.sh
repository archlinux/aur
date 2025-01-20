# https://wiki.archlinux.org/index.php/IBus

function set_im_env {
    im=ibus
    export GTK_IM_MODULE=$im
    export QT_IM_MODULE=$im
    export XMODIFIERS=@im=$im
    export INPUT_METHOD=$im
    export SDL_IM_MODULE=$im
}

if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
    set_im_env
else
  if [ "$XDG_CURRENT_DESKTOP" != "GNOME" ]; then
    set_im_env
  fi
fi

