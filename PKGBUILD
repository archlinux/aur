# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=bootloadhid
pkgver=20121208
pkgrel=2
pkgdesc="USB boot loader for AVR microcontrollers"
arch=("i686" "x86_64")
url="http://www.obdev.at/products/vusb/bootloadhid.html"
license=("GPL2" "GPL3")
depends=()
makedepends=(gcc)
#options=('!strip')
source=(http://www.obdev.at/downloads/vusb/bootloadHID.2012-12-08.tar.gz)
md5sums=('aab414a1458ef9b490994b5c8f8165b1')

build() {
  cd "$srcdir/bootloadHID.2012-12-08/commandline"
  make
}

package() {
  cd "$srcdir/bootloadHID.2012-12-08/commandline"
  install -D bootloadHID $pkgdir/usr/bin/bootloadHID
}

# vim:sw=2:
