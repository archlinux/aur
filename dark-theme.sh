#!/usr/bin/env sh

# Inspiration: https://www.reddit.com/r/unixporn/comments/f1oied/awesome_global_nightday_switch_for_gtk_vim/

# Requirements:
# glib2: for gsettings for GTK switching under Wayland
# xfce4-settings: for xfsettings for GTK switching under Xorg
# qt5ct: for Qt5 switching 
# adwaita-qt: as Qt5 theme
# sed: for switching multiple things by editing config files
# grep: for regex matching in conditionals
# jq: for switching code by editing JSON
# moreutils: providing sponge for in-place editing code config file
# feh: for setting wallpaper under Xorg
# sway: for setting wallpaper in sway

# enable "strict mode"
set -eu

# intialize all variables
SWAYSOCK=${SWAYSOCK:-}
XDG_SESSION_TYPE=${XDG_SESSION_TYPE:-}

CURRENT=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$1" = "dark" ]; then
  UI_THEME_GTK="Adwaita-dark"
  UI_THEME_QT="Adwaita-Dark"
  UI_VSCODE="Default Dark+"
  UI_ALACRITTY="dark"
  BG_X11="-B black ${HOME}/.wallpaper/light.png"
  BG_SWAY="output * background ~/.wallpaper/light.png center #000000"
elif [ "$1" = "light" ]; then
  UI_THEME_GTK="Adwaita"
  UI_THEME_QT="Adwaita"
  UI_VSCODE="Default Light+"
  UI_ALACRITTY="light"
  BG_X11="-B white ${HOME}/.wallpaper/dark.png"
  BG_SWAY="output * background ~/.wallpaper/dark.png center #FFFFFF"
elif [ "$1" = "toggle" ]; then
  if echo "$CURRENT" | grep -q "dark"; then
    exec $0 light
  else
    exec $0 dark
  fi
elif [ "$1" = "reapply" ]; then
  if echo "$CURRENT" | grep -q "dark"; then
    exec $0 dark
  else
    exec $0 light
  fi
else
  echo "Command $1 not valid."
  exit 1
fi


# set GTK theme
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  # start xfsettingsd - alreday running xfsettingd ignores this
  xfsettingsd --daemon --sm-client-disable --disable-wm-check
  # set GTK theme xia xsettings
  xfconf-query -c xsettings -p /Net/ThemeName -s "$UI_THEME_GTK"
  #xfconf-query -c xsettings -p /Net/IconThemeName -s "$UI_ICONS"
fi
# set GTK theme via gsettings
gsettings set org.gnome.desktop.interface gtk-theme "$UI_THEME_GTK"

# set Qt theme
f="$HOME/.config/qt5ct/qt5ct.conf"
if [ -w "$f" ]; then
  sed -i -E "s@^style=.*@style=${UI_THEME_QT}@" "$f"
fi

# set alacritty theme
f="$HOME/.config/alacritty/alacritty.yml"
if [ -w "$f" ]; then
  sed -i -E "s/^colors: \*.*$/colors: *$UI_ALACRITTY/" "$f"
fi

# set vscode theme
f="$HOME/.config/Code - OSS/User/settings.json"
if [ -w "$f" ]; then
  jq ".[\"workbench.colorTheme\"]=\"${UI_VSCODE}\"" "$f" | sponge "$f"
fi

# set neovim background
for r in $(nvr --serverlist); do
  nvr --servername "$r" -c "set background=${UI_NEOVIM}"
done

# set background
# properly supply arguments separated by spaces
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  feh --no-fehbg --bg-center ${BG_X11}
elif [ -n "$SWAYSOCK" ]; then
  swaymsg "$BG_SWAY"
else
  echo "No supported window manager."
  echo "Not setting background."
fi
