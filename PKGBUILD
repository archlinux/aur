# Maintainer: Dan Fox <aur@danielfox.ie>
pkgname=dcalc
pkgver=2.12
pkgrel=1
pkgdesc="RPN Calculator in curses, predecessor to gdcalc"
arch=('any')
url="http://bhepple.freeshell.org/dcalc/unix/dcalcCurses.html"
license=('GPL2')
source=("http://bhepple.freeshell.org/$pkgname/unix/$pkgname-$pkgver.tgz")
md5sums=("8ee281095f4491ced050ec0394943b9e")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
        strip dcalc
        mkdir -p $pkgdir/usr/bin/
        cp dcalc $pkgdir/usr/bin/
}
