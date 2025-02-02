# Maintainer: sineptic <sineptic0@gmail.com>
pkgsubn=none
pkgname=none
pkgver=1.0
pkgrel=0
pkgdesc='A placeholder command'
arch=('any')
license=('MIT')

package() {
	echo "" > "${srcdir}/none.sh"
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/none.sh" "${pkgdir}/usr/bin/none"
	chmod +x "${pkgdir}/usr/bin/none"
}
