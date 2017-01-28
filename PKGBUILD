# Maintainer: Tom Hutchinson <aur [@] tomisme [dot] com>
pkgname=stout-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A reliable static website deploy tool"
arch=(any)
url="https://github.com/EagerIO/Stout"
license=('MIT')
source=("https://github.com/EagerIO/Stout/releases/download/v$pkgver/stout-linux")
md5sums=('dfe18c41b17c4aae0d2670f72ffa35a9')

package() {
				cd "$srcdir"
				mv stout-linux stout
				chmod +x stout
				mkdir -p "$pkgdir/usr/bin"
				cp stout "$pkgdir/usr/bin"
}
