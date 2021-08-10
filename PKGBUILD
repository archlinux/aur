# Maintainer: Gingka Akiyama <gingkathfox @ gmail . com>
pkgname=uwupp
pkgver=0.2.0.r0.g4b993e7
pkgrel=1
pkgdesc="The next generation esoteric language."
arch=('x86_64')
url="https://github.com/Deltaphish/UwUpp/"
license=('BSD')
groups=()
depends=(stack)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/Deltaphish/UwUpp.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/UwUpp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/UwUpp"
  stack build
}

package() {
  cd "$srcdir/UwUpp"
  stack install
}
