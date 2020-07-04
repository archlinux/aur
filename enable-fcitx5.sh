# https://wiki.archlinux.org/index.php/Fcitx5
im=fcitx5
export GTK_IM_MODULE=$im
export QT_IM_MODULE=$im
export XMODIFIERS=@im=$im

if [ ! -e ~/.config/fcitx5/profile ]; then
    install -D /usr/share/manjaro-asian-input-support-fcitx5/profile ~/.config/fcitx5/profile
fi
