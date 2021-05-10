# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.9.3
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt5-base qt5-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("098b62542766bb16f0403b09a724934e23065f7da5ae4f0e34e4cdc2b37e6692")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
