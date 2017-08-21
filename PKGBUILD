# Maintainer: Andrew Anderson <aanderso@tcd.ie>

pkgname=pbqp
pkgver=1.0
pkgrel=1

epoch=
pkgdesc="Bernhard Scholz' PBQP solver tool"
arch=('x86_64' 'aarch64')
url="http://www.complang.tuwien.ac.at/scholz/pbqp"
license=('BSD')
groups=()
depends=()
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
source=("http://www.complang.tuwien.ac.at/scholz/pbqp/pbqp.tar.gz")

#noextract=()

sha1sums=("bc6b169aeb66cddc040af5d7d7b6c957f4d95cfd")

#validpgpkeys=()

build() {
  make -C pbqp/src
}

#check() {}

package() {
  make -C pbqp/src install
  mkdir -p $pkgdir/usr/bin/
  cp pbqp/bin/pbqp_solve $pkgdir/usr/bin/
}
