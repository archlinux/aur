# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=xenlism-storm-icon-theme
_themename=Storm
pkgver=2018.05beta2
pkgrel=1
pkgdesc="None form icons theme for X11 Desktop"
arch=("any")
url="https://github.com/xenlism/Storm"
license=("GPL3")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/xenlism/Storm/archive/$pkgver.tar.gz")
md5sums=('6d5b2df688c1a2016c87af6e1e2d1c08')

package() {
	cd "$srcdir/$_themename-$pkgver"
	install -d "${pkgdir}/usr/share/icons/"
	cp -r icons/* $pkgdir/usr/share/icons/

	#Install License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
