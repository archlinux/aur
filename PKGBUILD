# Maintainer: Tom Hutchinson <aur [@] tomisme dotcom>
pkgname=stout-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="A reliable static website deploy tool"
arch=(any)
url="https://github.com/EagerIO/Stout"
license=('MIT')
source=("https://github.com/EagerIO/Stout/releases/download/v$pkgver/stout-linux")
md5sums=('7ab003835b2780c79b67403b9d193b41')

package() {
	cd "$srcdir"
 mv stout-linux stout
 chmod +x stout
 mkdir -p "$pkgdir/usr/bin"
 cp stout "$pkgdir/usr/bin"
}
