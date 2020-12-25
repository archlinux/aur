# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.1
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots')
source=("https://github.com/djpohly/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/" install
}
