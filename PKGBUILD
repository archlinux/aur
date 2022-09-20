# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=1.08
pkgrel=1
pkgdesc="X11 Bible reading tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt6-base qt6-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=("2ffb7a8c79ac6521103ddf7883581c4d0eca90be9b68db5b0a5ef833df07b156")

build() {
    cd "SoulAnchor-${pkgname}-${pkgver}"
    qmake6
    make
}

package() {
	cd "SoulAnchor-${pkgname}-${pkgver}"
	make install INSTALL_ROOT=${pkgdir}
}
