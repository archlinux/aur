# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname="mcmojave-cursors"
pkgver=1.0
pkgrel=2
pkgdesc="X-cursor theme inspired by macOS and based on capitaine-cursors"
arch=("any")
url="https://github.com/vinceliuice/${pkgname}"
license=('GPL')
source=("${pkgname}::git+https://git@github.com/vinceliuice/${pkgname}.git")
md5sums=('SKIP')

build() {
	true
}

package() {
	cd "${srcdir}" || exit
	mkdir -p "${pkgdir}/usr/share/icons/${pkgname}"
	cp -r "${pkgname}"/dist/* "${pkgdir}/usr/share/icons/${pkgname}"
}
