#! /usr/bin/env bash

theme=$1

themes=("dark-amethyst" "dark-amethyst" "amethyst" "beryl" "dark-amethyst" "dark-beryl" "dark-doder" "dark-ruby" "dark" "doder" "light-amethyst" "beryl" "light-doder" "light-ruby" "light" "ruby")

for t in ${themes[*]}
do
    if [ "$theme" == "$t" ];then
    rm -rf ${HOME}/.config/gtk-4.0/{assets,gtk.css,gtk-dark.css}

    ln -sf /usr/share/themes/vimix-"$theme"/gtk-4.0/assets ${HOME}/.config/gtk-4.0/assets
    ln -sf /usr/share/themes/vimix-"$theme"/gtk-4.0/gtk.css ${HOME}/.config/gtk-4.0/gtk.css
    ln -sf /usr/share/themes/vimix-"$theme"/gtk-4.0/gtk-dark.css ${HOME}/.config/gtk-4.0/gtk-dark.css

    echo "set theme [$theme] done"

    exit 0
    fi
done

echo "theme must in [${themes[*]}]"
exit 1
