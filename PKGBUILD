# Maintainer: Samuel <umbrafex.com@gmail.com>
pkgname=gotodo
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple command-line todo list written in Go"
arch=('x86_64')
url="http://www.umbrafex.com/#gotodo"
licence=('CCPL:BY-NC-ND')
depends=('sqlite>=3.0.0')
md5sums=('493c4b5d420d24f9d1386393ce87e63b')
source=("http://www.umbrafex.com/packages/$pkgname-$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "gotodo" "$pkgdir/usr/bin/gotodo"
}
