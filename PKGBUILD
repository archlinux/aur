# Maintainer: Samuel <umbrafex.com@gmail.com>
pkgname=gotodo
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple command-line todo list written in Go"
arch=('x86_64')
url="http://www.umbrafex.com/#gotodo"
licence=('CCPL:BY-NC-ND')
source=("http://www.umbrafex.com/packages/$pkgname-$pkgver.tar.gz")
md5sums=('2a8256eca67796eeee98d617d19d37f5')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "gotodo" "$pkgdir/usr/bin/gotodo"
}
