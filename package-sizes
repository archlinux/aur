#!/bin/sh

# list pacman packages sorted by their "removable size".
#
# removable size is the space that will be freed up if
# you remove that package with `pacman -Rs <package>`.
#
# only explicitly installed packages are included.
#
# requires pacutils.

pacman -Qqt | pacinfo --removable-size | awk '
    /^Name:/ { name = $2 }
    /^Installed Size:/ { size = $3$4 }
    /^$/ { print size" "name }
' | sort -uk2 | sort -rh | ${PAGER:-less}
