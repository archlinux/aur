# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=1.0
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt6-base qt6-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("c4f3016c1571c6652b5e64b372b4dbed318e41aa4a13ef9ab974ac5b6aa9b079")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake6
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
