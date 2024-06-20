# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.3
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
sha256sums=('568ce2b99301b4bc967350fff5688d396f6d1738895cab24e992ef4d28bd6154')

package() {
	install -Dm0755 "$srcdir/bbmp" "$pkgdir/usr/bin/bbmp"
}
