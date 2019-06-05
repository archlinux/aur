# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xcursor-entis
pkgver=1.0
pkgrel=5
pkgdesc="Entis cursor theme"
arch=('any')
depends=('libxcursor')
makedepends=('p7zip')
url="http://www.entis-design.com/cursors/"
license=('GPL')
source=('https://distribute.kde.org/khotnewstuff/mousethemes/downloads/61037-entis_cursors_x11_others.tgz')
sha256sums=('d7f5471dac7c64a7ef699de4bf858d3d5045bf3efcc8072242bd582d26647160')

package() {
	cd ${srcdir}/entis_cursors_x11_others/cursors/

	for FILE in $(find -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/icons/Entis/cursors/${FILE}
	done
}

