# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=hidclient
pkgver=20060725
pkgrel=1
epoch=
pkgdesc="Client program to transmit local keyboard events over bluetooth."
arch=('i686' 'x86_64')
url="http://anselm.hoffmeister.be/computer/hidclient/"
license=('GPL')
groups=()
depends=('bluez-libs')
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
source=("$pkgname-$pkgver.tar.bz2")
md5sums=('d0670498038f11b23415880a873e3f55')
noextract=()

build() {
  cd "$srcdir/"

  make
}

package() {
  cd "$srcdir/"

  install -Dm755 hidclient "$pkgdir/usr/bin/hidclient"
  install -Dm644 hid-sdp-record.bin "$pkgdir/etc/bluetooth/hid-sdp-record.bin"
}

# vim:set ts=2 sw=2 et:
