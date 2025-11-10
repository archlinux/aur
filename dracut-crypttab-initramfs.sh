#! /bin/bash

# dracut module to install /etc/crypttab.initramfs to /etc/crypttab in generated files when found
# Copyright (C) 2025 Shanoa Ice
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

check() {
	if [[ -f "/etc/crypttab.initramfs" ]]; then 
		return 0
	fi
	return 1
}

depends() {
	echo "systemd-cryptsetup"
}

install() {
	if [[ -f "/etc/crypttab.initramfs" ]]; then
		inst -H "/etc/crypttab.initramfs" "/etc/crypttab"
	fi
}
