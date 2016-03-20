#!/usr/bin/bash
#
#   upx.sh - Compress package binaries with UPX
#
#   Copyright (c) 2011-2016 Pacman Development Team <pacman-dev@archlinux.org>
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

[[ -n "$LIBMAKEPKG_TIDY_UPX_SH" ]] && return
LIBMAKEPKG_TIDY_UPX_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/option.sh"


packaging_options+=('upx')
tidy_modify+=('tidy_upx')

tidy_upx() {
	if check_option "upx" "y"; then
		msg2 "$(gettext "Compressing binaries with %s...")" "UPX"
		local binary
		find . -type f -perm -u+w 2>/dev/null | while read -r binary ; do
			case "$(file --brief --mime-type "$binary")" in
				'application/x-executable' | 'application/x-dosexec')
					upx "${UPXFLAGS[@]}" "$binary" &>/dev/null ||
						warning "$(gettext "Could not compress binary : %s")" "${binary/$pkgdir\//}"
					;;
			esac
		done
	fi
}
