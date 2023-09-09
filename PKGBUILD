# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.2
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
sha256sums=('f704ca4dc9bc15a66d2ee63ef6831f4fc342fa14a082179b2f2bf2568594d935')

package() {
	install -Dm0755 $pkgname "$pkgdir/usr/bin/bbmp"
}
