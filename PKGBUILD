# Maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>

pkgname=jpnevulator
pkgver=2.3.4
pkgrel=1
pkgdesc="Jpnevulator is a nice serial sniffer and you can use it to send data on a serial line too."
arch=('x86_64')
url="https://jpnevulator.snarl.nl/"
license=('GPL')
source=(https://jpnevulator.snarl.nl/download/jpnevulator-$pkgver.tgz)
sha256sums=('752f4f0f2e7b2d0d799b41c7522458629cbf532e151fe79f3856becc3ba127f6')

build() {
	cd $srcdir/"${pkgname}"-"${pkgver}"
	make	
}

package() {
	cd $srcdir/"${pkgname}"-"${pkgver}"
	make DESTDIR="$pkgdir/" install
}
