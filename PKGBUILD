#Maintainer: Rafael Monico <aur@rmonico.e4ward.com>

_pkgname=anysh
pkgname=anysh
pkgver=1.0.0
pkgrel=1
pkgdesc='Generic wrapper for any shell command'
url='https://github.com/rmonico/anysh'
arch=(any)
license=(Apache)
depends=("python")
source=(anysh LICENSE)
md5sums=(edd450dfdd2ad5c8b2408aef843ea9d3 9455829e87574d644ee021084534734d)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/doc/anysh"

	cp "${srcdir}/anysh" "${pkgdir}/usr/bin/"
	cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/doc/anysh/"
}

