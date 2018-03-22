# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=yape
_pkgname=yapesdl
pkgver=0.70.2
pkgrel=2
pkgdesc="Multiplatform Commodore 64 and 264 family emulator written in C++ using SDL2"
arch=(i686 x86_64)
url=https://github.com/calmopyrin/yapesdl
license=(GPL)
depends=(sdl2)
source=(https://github.com/calmopyrin/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=(daecce901b6465c55889094f67f0b4147a95008305f159a32302689fdcad69a6)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make
}

package() {
	install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
}
