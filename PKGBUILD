# Maintainer: Matt Moore <matt@mattmoore.io>
_pkgname=h2o
pkgname=h2ogames
pkgver=0.1.0
pkgrel=3
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
sha512sums=("9bb0ea985bffb61e2b80efdd2f7dff6602903d3cac657d472e15f72b0c2db6a3df4ba6e100b8453977eca88f17fb322b44d9627da9ae3e03dde453844051ce42")
validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp libh2o.rlib "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  cp h2o "${pkgdir}/usr/bin/"
}
