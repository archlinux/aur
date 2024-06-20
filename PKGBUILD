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
sha256sums=('3f8e61a9de4596cc99cf5f9ab8bfa7196e7b49c8130a43bc0b009064e73e7da6')

package() {
	install -Dm0755 "$srcdir/bbmp" "$pkgdir/usr/bin/bbmp"
}
