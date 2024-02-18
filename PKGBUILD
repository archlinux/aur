# Maintainer: Matt Moore <matt@mattmoore.io>
_pkgname=h2o
pkgname=h2ogames
pkgver=0.1.0
pkgrel=2
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
sha512sums=("7d5ce2010264740e906bf95c6ebed934ea686e7b0b160ce34c6f686c86ee6e8162d2b05b93a99b9575a45337b73b6c93ff716bc2d9e7425b32ccbdd20076899d")
validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp libh2o.rlib "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  cp h2o "${pkgdir}/usr/bin/"
}
