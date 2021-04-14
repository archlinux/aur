# Maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>

pkgname=jpnevulator
pkgver=2.3.6
pkgrel=1
pkgdesc="Jpnevulator is a nice serial sniffer and you can use it to send data on a serial line too."
arch=('x86_64')
url="https://jpnevulator.snarl.nl/"
license=('GPL')
source=(https://jpnevulator.snarl.nl/download/jpnevulator-$pkgver.tgz)
sha256sums=('4f9e1c38a23f7b15794731ee31f873f33371b9d9ea412f5404d9f008a85e803d')

build() {
	cd $srcdir/"${pkgname}"-"${pkgver}"
	make	
}

package() {
	cd $srcdir/"${pkgname}"-"${pkgver}"
	make DESTDIR="$pkgdir/" install
}
