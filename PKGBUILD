# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.9.5
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt5-base qt5-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("d4f944ff0b89ee15c1a99f7c1b6eee471782b4287fdda489357e86d031481efd")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
