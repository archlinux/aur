# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.9.2
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt5-base qt5-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("34cd764a130bdd9cdf50dcdb693f033a573b1840605a14d3d9b2d4ce962ac686")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
