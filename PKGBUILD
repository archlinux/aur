# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>
pkgname=tonespace
pkgver=2.9.20220308
pkgrel=1
pkgdesc="chord generator and visualizer"
arch=('x86_64')
url="https://www.mucoder.net/en/tonespace"
license=('unknown')
source=("https://www.mucoder.net/en/tonespace/v0209/download/tonespace-2.9.20220308.2-linux.zip")
sha256sums=('a4b7e19f4cf080b971978202bb483f5bd1b44c367f1326d504440725a483b7ea')

package() {
	mkdir -p "$pkgdir/usr/bin"
	chmod +x tonespace
	cp tonespace "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	cp tonespace.so "$pkgdir/usr/lib"
}
