# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=1.06
pkgrel=1
pkgdesc="X11 Bible reading tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt6-base qt6-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("430ca01ecc87d5982e3b6180efb0dd170b4b3005038ba6c1f759c8cfd25436d9")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake6
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
