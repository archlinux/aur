# https://wiki.archlinux.org/index.php/IBus

function set_im_env {
    echo "Setting environment variables for Input Method."
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
  if [ "$XDG_CURRENT_DESKTOP" != "GNOME" ] && [ "$XDG_CURRENT_DESKTOP" != "KDE" ]; then
    set_im_env
  else
    echo "Setting environment variables is not necessary in a Wayland environment(GNOME or KDE)."
  fi
fi

