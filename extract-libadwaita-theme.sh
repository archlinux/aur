#!/bin/bash
mkdir -p /usr/share/themes/Adw{,-dark}/gtk-4.0/assets
for rpath in $(gresource list /usr/lib/libadwaita-1.so | grep '^/org/gnome/Adwaita/styles/'); do
   resource=${rpath#/org/gnome/Adwaita/styles/}
   gresource extract /usr/lib/libadwaita-1.so "$rpath" > "/usr/share/themes/Adw/gtk-4.0/$resource"
   ln -sfrT /usr/share/themes/Adw{,-dark}/gtk-4.0/"$resource" 
done
cat /usr/share/themes/Adw/gtk-4.0/{base,defaults-light}.css > /usr/share/themes/Adw/gtk-4.0/gtk.css
cat /usr/share/themes/Adw-dark/gtk-4.0/{base,defaults-dark}.css > /usr/share/themes/Adw-dark/gtk-4.0/gtk.css
ln -sfT ../../Adw-dark/gtk-4.0/gtk.css /usr/share/themes/Adw/gtk-4.0/gtk-dark.css
