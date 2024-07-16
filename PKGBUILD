# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=yape
_pkgname=yapesdl
pkgver=0.80.1
pkgrel=1
pkgdesc="Multiplatform Commodore 64 and 264 family emulator written in C++ using SDL2"
arch=(i686 x86_64)
url=https://github.com/calmopyrin/yapesdl
license=(GPL)
depends=(sdl2)
source=(https://github.com/calmopyrin/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=(2cb62a14022ac7e0edc0c8d1d90d38371a13f08ee4afa79746bdf4b89c274d6c)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make
}

package() {
	install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
}
