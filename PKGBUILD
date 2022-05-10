# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=1.04
pkgrel=1
pkgdesc="X11 Bible reading tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt6-base qt6-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("3e28e26058cc026c224abbbca86ae1d4f72c6e4ad4538b4782fa557ffe062eb0")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake6
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
