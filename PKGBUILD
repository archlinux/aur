# Maintainer: Matt Moore <matt@mattmoore.io>
_pkgname=h2o
pkgname=h2ogames
pkgver=0.1.0
pkgrel=4
epoch=
pkgdesc="Game management client for h2o games."
arch=("x86_64")
url="https://github.com/mattmoore/h2o"
license=('Apache-2.0')
groups=()
depends=(
  'xz'
  'glibc'
  'gcc-libs'
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/mattmoore/h2o/releases/download/v0.1.0/$_pkgname-$pkgver.tar.xz")
sha512sums=("0aaa690fb36583e5b77103f91f5d8e99f76004cb97f53145d041321f15b1711166973fe0ae2cb064c37c97bdaa8d33eae70e4ccecdeef2e964394a9459cc06fb")
validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp libh2o.rlib "${pkgdir}/usr/lib/"
  cp libh2o.so "${pkgdir}/usr/lib/"
  cp libh2o.a "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  cp h2o "${pkgdir}/usr/bin/"
}
