# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=nbc
pkgver=1.2.1.r4
pkgrel=4
pkgdesc="Next Byte Codes (NBC) compiler for the LEGO Mindstorms NXT programmable brick"
arch=('i686' 'x86_64')
url="http://bricxcc.sourceforge.net/nbc/"
license=('MPL')
groups=()
depends=('libusb-compat')
makedepends=('fpc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://sourceforge.net/projects/bricxcc/files/NBC_NXC/NBC%20release%201.2.1%20r4/nbc-1.2.1.r4.src.tgz)
noextract=()
sha1sums=('d6b2f45cbe2153ecf28de038683bd108c36ce7eb')

build() {
  cd "$srcdir/NXT"
  make -f nbcunix.mak
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/NXT/nbc" "$pkgdir/usr/bin"
}
