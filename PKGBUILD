# Maintainer: amtoaer <amtoaer@outlook.com>
pkgname=medum-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="a terminal todo manager written in go"
arch=('x86_64')
url="https://github.com/amtoaer/medum"
license=('MIT')

source=("https://github.com/amtoaer/medum/releases/download/v$pkgver/medum")

md5sums=('9d1a30b7fbd86a2786fa95d677d5e154')

package(){
	install -D -m 755 $srcdir/medum $pkgdir/usr/bin/medum
}
