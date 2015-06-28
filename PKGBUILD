# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xcursor-entis
pkgver=1.0
pkgrel=4
pkgdesc="Entis cursor theme"
arch=('any')
depends=('libxcursor')
makedepends=('p7zip')
url="http://www.entis-design.com/cursors/"
license=('GPL')
source=('http://www.entis-design.com/data/entis_cursors_x11_others.7z')
sha256sums=('72c0f02aaf2892d5e2edcf32fbea6455566050a0e9927d75580f0c3cfd804c5f')

package() {
	cd ${srcdir}/entis_cursors_x11_others/cursors/

	for FILE in $(find -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/icons/Entis/cursors/${FILE}
	done
}

