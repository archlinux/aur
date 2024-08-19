pkgver='1.0.0'
pkgrel='1'
pkgdesc="Simple desktop environment targeted for old systems and HiDPI compatible"
arch=('x86_64')
depends=(wget)
pkgname="fluorine"
license=('GPL')
source=("flstart")
sha512sums=("SKIP")
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/flstart" "${pkgdir}/usr/bin/flstart"
 	chmod +x "${pkgdir}/usr/bin/flstart"
}
