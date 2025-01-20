# https://wiki.archlinux.org/index.php/IBus

function set_im_env {
    im=ibus
    export GTK_IM_MODULE=$im
    export QT_IM_MODULE=$im
    export XMODIFIERS=@im=$im
    export INPUT_METHOD=$im
    export SDL_IM_MODULE=$im
}

function set_im_env_kde_wayland {
    im=ibus
    export XMODIFIERS=@im=$im
    export INPUT_METHOD=$im
    export SDL_IM_MODULE=$im
}

if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
    set_im_env
else
  if [ "$XDG_CURRENT_DESKTOP" != "GNOME" ] && [ "$XDG_CURRENT_DESKTOP" != "KDE" ]; then
    set_im_env
  elif [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
	set_im_env_kde_wayland
  fi
fi

