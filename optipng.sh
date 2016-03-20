#!/usr/bin/bash
#
#   optipng.sh - Compress PNG files using optpng
#
#   Copyright (c) 2015-2016 Pacman Development Team <pacman-dev@archlinux.org>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

[[ -n "$LIBMAKEPKG_TIDY_OPTIPNG_SH" ]] && return
LIBMAKEPKG_TIDY_OPTIPNG_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/option.sh"


packaging_options+=('optipng')
tidy_modify+=('tidy_optipng')

tidy_optipng() {
	if check_option "optipng" "y"; then
		msg2 "$(gettext "Optimizing PNG images...")"
		local png
		find . -type f -iname "*.png" 2>/dev/null | while read -r png ; do
			if [[ $(file --brief --mime-type "$png") = 'image/png' ]]; then
				optipng "${OPTIPNGFLAGS[@]}" "$png" &>/dev/null ||
					warning "$(gettext "Could not optimize PNG image : %s")" "${png/$pkgdir\//}"
			fi
		done
	fi
}
