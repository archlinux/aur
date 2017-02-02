# Maintainer: Tom Hutchinson <aur [@] tomisme [dot] com>
pkgname=stout-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A reliable static website deploy tool"
arch=(any)
url="https://github.com/EagerIO/Stout"
license=('MIT')
source=("https://github.com/EagerIO/Stout/releases/download/v$pkgver/stout-linux")
md5sums=('983cdd64383ae5d5c936d40cb919b815')

package() {
				cd "$srcdir"
				mv stout-linux stout
				chmod +x stout
				mkdir -p "$pkgdir/usr/bin"
				cp stout "$pkgdir/usr/bin"
}
