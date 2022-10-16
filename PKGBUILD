# Maintainer: xezo360hye <xezo360hye@gmail.com>
# Contributor: K4zoku <kazoku0356@gmail.com>
_pkgname="nowm"
pkgname="${_pkgname}"
pkgver=0.0.1
pkgrel=2
pkgdesc="Managing window without a window manager"
arch=('any')
url="https://github.com/K4zoku/nowm"
license=('MIT')
depends=('sh' 'xdotool')
optdepends=('xorg-xinit: for starting Xorg automatically')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/K4zoku/nowm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('668bdd83fbee70ffa4b4bbf54570dc6a2798515a615574a7f9d181124a727e88')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "bin/nowm" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "man/nowm.1" -t "${pkgdir}/usr/share/man/man1"
}
