# Maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>

pkgname=jpnevulator
pkgver=2.1.3
pkgrel=1
pkgdesc="Jpnevulator is a nice serial sniffer and you can use it to send data on a serial line too."
arch=('i686' 'x86_64')
url="http://jpnevulator.snarl.nl/"
license=('GPL')
depends=('glibc')
makedepends=('setuptools')
source=(http://jpnevulator.snarl.nl/download/jpnevulator-$pkgver.tgz)
md5sums=('a2a5c27c5cdea7d22d7fc8f10cbef183')

build() {
	cd $srcdir/"${pkgname}"-"${pkgver}"
	make	
}

package() {
	cd $srcdir/"${pkgname}"-"${pkgver}"
	make DESTDIR="$pkgdir/" install
}
