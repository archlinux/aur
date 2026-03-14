# Maintainer: Thomas Scheller <t.scheller@email.de>
pkgname=atari-tools
pkgver=835d5a6
pkgrel=1
epoch=
pkgdesc="Manipulate Atari 800 .ATR images. Convert between .ATR and .IMD (ImageDisk) formats."
arch=('i686' 'x86_64')
url="https://github.com/jhallen/atari-tools"
license=('UNKNOWN')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("atari-tools")
conflicts=("atari-tools")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jhallen/atari-tools#commit=${pkgver}")
sha256sums=('SKIP')
noextract=()

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 755 atr "$pkgdir/usr/bin/atr"
}

# vim:set ts=2 sw=2 et:
