# Maintainer: Zakros
pkgname=medum-bin
pkgver=1.1.4
pkgrel=2
pkgdesc="a terminal todo manager written in go"
arch=('x86_64')
url="https://github.com/amtoaer/medum"
license=('MIT')

source=("https://github.com/amtoaer/medum/releases/download/v$pkgver/medum")

md5sums=('9d1a30b7fbd86a2786fa95d677d5e154')

package(){
	install -Dm755 $srcdir/medum $pkgdir/usr/bin/medum
}
