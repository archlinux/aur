# Maintainer: somercet <somercet at gmail dot com>

pkgname="menjar"
pkgver=0.1
pkgrel=1
pkgdesc="A .desktop file aggregator for dmenu-or bemenu-like apps, like i3-dmenu-desktop."
arch=("any")
url="https://github.com/somercet/menjar"
license=("GPL2")
optdepends=("bemenu" "dmenu")
depends=("awk")
source=("https://github.com/somercet/menjar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7004ba98fa92fa0f16af32f0cbb05cdff30ce9b8858da396edbed753f4b07399")

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

