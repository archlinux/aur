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
sha256sums=('e879b15469b96ad46403983ac0251e5939bf489986faba51bd480f6a6f3fa9dc')

package() {
	install -Dm0755 "$srcdir/bbmp" "$pkgdir/usr/bin/bbmp"
}
