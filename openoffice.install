#!/bin/bash

# Inappropriate parts removed:
# - mime.type stuff is already provided by mime-types package
# - /etc/mailcap does not exist on ArchLinux normaly
# - Don't use 'which' because tools are already in depends

post_install() {
  ( ### freedesktop-menus postin (OOO 3.4)

update-desktop-database -q usr/share/applications

update-mime-database usr/share/mime

for theme in gnome hicolor locolor; do
if [ -e usr/share/icons/$theme/icon-theme.cache ] ; then
  # touch it, just in case we cannot find the binary...
  touch usr/share/icons/$theme
  gtk-update-icon-cache -q usr/share/icons/$theme
  # ignore errors (e.g. when there is a cache, but no index.theme)
  true
fi
done
  )
}

post_remove() {
  ( ### freedesktop-menus postun (OOO 3.4)
update-desktop-database -q

update-mime-database usr/share/mime

for theme in gnome hicolor locolor; do
if [ -e usr/share/icons/$theme/icon-theme.cache ] ; then
  # touch it, just in case we cannot find the binary...
  touch usr/share/icons/$theme
  gtk-update-icon-cache -q usr/share/icons/$theme
  # ignore errors (e.g. when there is a cache, but no index.theme)
  true
fi
done
  )
}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
  post_install "$1"
}

# vim:set ts=2 sw=2 et:
