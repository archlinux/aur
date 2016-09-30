# Contributor: Mladen Pejakovic <pejakm at autistici dot org>

pkgname=checksums
pkgver=0.5
pkgrel=1
pkgdesc="Service menu and a small script for calculation of md5, sha1 and sha256 checksums"
url=""
depends=('kdialog')
license=('GPL')
arch=('any')

source=(checksums.desktop
	checksums.sh)
md5sums=('c5b67e2b939ead50b36f10d3cbb298b5'
         '60f8579606e732f2005d091042817d3a')

package() {
	cd ${srcdir}
	install -D -m 755 checksums.sh ${pkgdir}/usr/bin/checksums.sh
	install -D -m 755 checksums.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/checksums.desktop
}
