# Copyright 2018 Google Inc. All Rights Reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Maintainer: Lorenzo Castelli <lcastelli@gmail.com>
# Maintainer: Samuel Littley <samuellittley@google.com>

pkgname='growpartfs'
pkgver=1.00
pkgrel=1
pkgdesc='Extends a partition to fill available space'
arch=('any')
license=('GPL3')
source=('growpartfs'
        'growpartfs@.service')
depends=('cloud-utils')
replaces=('growpart')
sha256sums=('01576833fe3034c38f57b57b498f24ffe06263f6bcec25f79e57481aa854ac9b'
            'abb9633ea0a2bef1ae7c91b15267c1d901d63bb1d2f3caab76ecacc47a4b9c10')

package() {
	install -m755 -Dt "$pkgdir/usr/bin/" growpartfs
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system/" growpartfs@.service
}
