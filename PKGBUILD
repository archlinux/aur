# Maintainer: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=logtop
pkgver=0.6
pkgrel=1
pkgdesc="Display real time statistics of whatever you want."
arch=('x86_64')
url="https://github.com/JulienPalard/logtop/"
license=('GPL')
depends=('uthash' 'ncurses')
source=("https://github.com/JulienPalard/$pkgname/archive/$pkgname-$pkgver.tar.gz")
md5sums=('3323a9ab12e4884eebe32e48ff1f245d')

package() {
  cd "$pkgname-$pkgname-$pkgver"

	make DESTDIR=$pkgdir install

	install -D -m0644 "doc/logtop.1" "${pkgdir}/usr/share/man/man1/logtop.1"
}
