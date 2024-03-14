# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=1.09
pkgrel=1
pkgdesc="X11 Bible reading tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt6-base qt6-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f5c04eba7f98c6ba0d7934e1e2f2d5e6aa7ccfddbcb67898ea0b997f234da939")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake6
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
