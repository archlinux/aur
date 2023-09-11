# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.2b
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
sha256sums=('04c717a56e673fa92393356fd672f69e0ec45a011693a361539c44f3e156df49')

package() {
	install -Dm0755 "$srcdir/bbmp" "$pkgdir/usr/bin/bbmp"
}
