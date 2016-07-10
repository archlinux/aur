# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=teensy_loader_cli
pkgver=38
pkgrel=1
pkgdesc='Command line Teensy Loader'
arch=('i686' 'x86_64')
url="http://www.pjrc.com/teensy/loader_cli.html"
license=('GPL3')
depends=('libusb' 'avrdude' 'avr-gcc' 'avr-libc')
source=('https://github.com/PaulStoffregen/teensy_loader_cli/archive/master.tar.gz')
sha256sums=('26a131a4e5436e8112026b4827c4519bc5b3570788b927b6b4f915445194dbeb')

build() {
	cd "$pkgname-master"
	make
}

package() {
	cd "$pkgname-master"
	install -Dt "$pkgdir/usr/bin" teensy_loader_cli
}
