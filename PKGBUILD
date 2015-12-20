# Author: Dominic Radermacher <dominic.radermacher@gmail.com>
pkgname=lan951x-led-ctl
pkgver=1.0
pkgrel=1
pkgdesc="Command line tool to control the LED's of a LAN9512/LAN9514 ethernet controller"
arch=('i686' 'armv6h' 'armv7h')
url="http://mockmoon-cybernetics.ch/computer/"
license=('GPL2')
depends=('libusb>=1.0')
source=(git://github.com/dradermacher/$pkgname.git)
sha256sums=('SKIP')

build() {
	cd $srcdir/$pkgname
	make
}
package() {
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir install
}
