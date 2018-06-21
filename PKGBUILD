# Maintainer: Tom Hutchinson <aur [@] tomisme [dot] com>
pkgname=stout-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="A reliable static website deploy tool"
arch=(any)
url="https://github.com/cloudflare/Stout"
license=('MIT')
source=("https://github.com/cloudflare/Stout/releases/download/v$pkgver/stout-linux")
md5sums=('62104b37707ad2ef802dcb5cb7625911')

package() {
				cd "$srcdir"
				mv stout-linux stout
				chmod +x stout
				mkdir -p "$pkgdir/usr/bin"
				cp stout "$pkgdir/usr/bin"
}
