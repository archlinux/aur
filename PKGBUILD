# Mantainer: defendor at riseup dot net

pkgname=xcursor-base
pkgver=3
pkgrel=2
pkgdesc="Subtle xcursor themes"
arch=('any')
url="http://customize.org/xcursors/34799"
license=('GPL3')
depends=('')
source=("http://archive.customize.org/files/xcursors/BASE0-3.tar.bz2")
md5sums=('b34f8ef3ac08b29174ddc244d74a25cf' )

_extractedfolder=BASE

package() {
	cd "${srcdir}/${_extractedfolder}"
	mkdir -p "${pkgdir}/usr/share/icons"
	cp -r White Blue "${pkgdir}/usr/share/icons"
	
}
