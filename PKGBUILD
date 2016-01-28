# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot org>

pkgname=xfwm4-theme-hers
pkgver=0.1.0
pkgrel=1
pkgdesc="This is a slightly modified version of axiom with buttons from XGTK"
arch=('any')
depends=('xfwm4')
url='http://xfce-look.org/content/show.php/hers?content=166841'
license=('GPL')
source=('http://xfce-look.org/CONTENT/content-files/166841-hers.zip')
sha256sums=('269f67260e04e191d67a2ca3160663fffb3481935773b4882ac345dfe59fcc0e')

package() {

	cd ${srcdir}

	for FILE in $(find hers/xfwm4/ -type f); do
		install -D -m0644 ${FILE} ${pkgdir}/usr/share/themes/${FILE}
	done
}
