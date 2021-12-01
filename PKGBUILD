# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname="mcmojave-cursors"
pkgver=1.0
pkgrel=2
pkgdesc="X-cursor theme inspired by macOS and based on capitaine-cursors"
arch=("any")
url="https://github.com/vinceliuice/${pkgname}"
license=('GPL')
makedepends=('git')
provides=("${pkgname}")
source=("git+https://github.com/vinceliuice/${pkgname}")
md5sums=('SKIP')

package() {
	cd "${srcdir}" || exit
	mkdir -p "${pkgdir}/usr/share/icons/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/icons/${pkgname}/cursors"
	install -Dm755 "${pkgname}"/dist/index.theme -t "${pkgdir}/usr/share/icons/${pkgname}"
	install -Dm755 "${pkgname}"/dist/cursors/* -t "${pkgdir}/usr/share/icons/${pkgname}/cursors"
}
