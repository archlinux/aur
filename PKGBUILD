# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=yape
_pkgname=yapesdl
pkgver=0.71.2
pkgrel=2
pkgdesc="Multiplatform Commodore 64 and 264 family emulator written in C++ using SDL2"
arch=(i686 x86_64)
url=https://github.com/calmopyrin/yapesdl
license=(GPL)
depends=(sdl2)
source=(https://github.com/calmopyrin/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=(cf9ec048503ece60b6bf31c761923369343d2490470f687a8c6f9a28df94885c)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make
}

package() {
	install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
}
