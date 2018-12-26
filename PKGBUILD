# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=logtop
pkgver=0.7
pkgrel=1
pkgdesc="Display real time statistics of whatever you want."
arch=('i686' 'x86_64')
url="https://github.com/JulienPalard/logtop/"
license=('GPL')
depends=('uthash' 'ncurses')
source=("https://github.com/JulienPalard/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('c63371cd806b1b1e80e2e39b988c039d90264e6d92f8c03762035b6f74fa8730')

package() {
	cd "$pkgname-$pkgname-$pkgver"

	make DESTDIR=$pkgdir install

	install -D -m0644 "doc/logtop.1" "${pkgdir}/usr/share/man/man1/logtop.1"
}
