# Maintainer: sonnewalth <thesecret1 at tutanota dot dee ee (as in 'deutsch')>
# Contributer: Jackson Baker Ryan <jackson.baker.ryan at gmail dot com>

# SPDX-License-Identifier: 0BSD
# SPDX-FileCopyrightText: Arch Linux contributors

pkgname=otf-nimbus-mono
pkgdesc="Nimbus Mono typeface - A serif, typewriter typeface"
pkgver=1.0
pkgrel=1
arch=('any')
license=('GPL-2.0-or-later')
source=("https://www.fontsquirrel.com/fonts/download/nimbus-mono")
sha256sums=('c4c1080cf390b05897febd3a17beb99763084e876645330a3b079877380e27b7')

package() {
	cd $srcdir
	for f in *.otf; do
  		install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/nimbus-mono" "$f"
	done
  		install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/license.txt" GNU\ General\ Public\ License.txt
}
