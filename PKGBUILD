# Maintainer: Tom Hutchinson <aur [@] tomisme [dot] com>
pkgname=stout-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="A reliable static website deploy tool"
arch=(any)
url="https://github.com/EagerIO/Stout"
license=('MIT')
source=("https://github.com/EagerIO/Stout/releases/download/v$pkgver/stout-linux")
md5sums=('a22a5e5bb6adcffc4d2380ed0d365f15')

package() {
				cd "$srcdir"
				mv stout-linux stout
				chmod +x stout
				mkdir -p "$pkgdir/usr/bin"
				cp stout "$pkgdir/usr/bin"
}
