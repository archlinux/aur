# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.0
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://github.com/dgrisham/bbmp/releases/download/${pkgver}/bbmp")
depends=('mpd')
sha256sums=('e5760cc4f379afd6b5c52ed031c2b782a0aa19df6df4eae54706f99e2ae80cbc')

package() {
	install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
