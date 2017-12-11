# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname=brittany
pkgver=0.9.0.0
pkgrel=1
pkgdesc="An Haskell source code formatter."
arch=('i686' 'x86_64')
url="https://github.com/lspitzner/${pkgname}"
license=('AGPL3')
depends=()
makedepends=('stack')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${url}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('bc50e53b29fc2bc3c9ce8b3a2525db21')
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  stack build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  stack install --local-bin-path "${pkgdir}/usr/bin"
}
