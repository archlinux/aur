# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=pinentry-wayland
pkgver=1.1
pkgrel=1
pkgdesc="A small shell script wrapper for setting different pinentry-clients for Wayland GUI and terminal usage."
arch=('any')
url="https://github.com/otahontas/pinentry-wayland/blob/master/README.md"
license=('CC0 1.0 Universal')
source=("https://github.com/otahontas/pinentry-wayland/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
	install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
