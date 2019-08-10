# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>
pkgname=tonespace
pkgver=2.5.544
pkgrel=1
pkgdesc="chord generator and visualizer"
arch=('x86_64')
url="https://www.mucoder.net/en/tonespace"
license=('unknown')
source=("https://www.mucoder.net/en/tonespace/v0205/download/544/tonespace-2.5.544-linux-64bit.zip")
md5sums=('f2a88b3f84cab982f5740b4668ef52f0')

package() {
	mkdir -p "$pkgdir/usr/bin"
	chmod +x tonespace
	cp tonespace "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	cp tonespace.so "$pkgdir/usr/lib"
}
