# Maintainer: somercet <somercet at gmail dot com>

pkgname="menjar"
pkgver=0.2
pkgrel=1
pkgdesc="A .desktop file aggregator for dmenu-or bemenu-like apps, like i3-dmenu-desktop."
arch=("any")
url="https://github.com/somercet/menjar"
license=("GPL2")
optdepends=("bemenu" "dmenu")
depends=("awk")
source=("https://github.com/somercet/menjar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("76872bb6068ad6f7cef26dbf2e5b248e8701188570eec09ff157788ef665ebfb")

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

