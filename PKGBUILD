# Maintainer: Thomas Scheller <amiga@amiga-dt-01>
pkgname=dir2atr
pkgver=221009
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("dir2atr")
conflicts=("dir2atr")
replaces=()
backup=()
options=()
install=
changelog=
source=(https://www.horus.com/~hias/atari/atarisio/atarisio-221009.tar.gz)
sha256sums=('d3dfcc966b782fd5c23b46a0363648e7604670c0506b759553266f29a08f243c')


noextract=()

build() {
  cd "$srcdir/atarisio-$pkgver/tools"

  make dir2atr
}

package() {
  cd "$srcdir/atarisio-$pkgver/tools"

  install -D -m 755 dir2atr "$pkgdir/usr/bin/dir2atr"
}

# vim:set ts=2 sw=2 et:
