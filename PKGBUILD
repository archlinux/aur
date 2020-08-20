# Maintainer:jpe90 <patriot.game@gmail.com>
pkgname='ttf-fredoka-one'
pkgver=1.0.0
pkgrel=1
pkgdesc='Round, bold font by Milena Brandao'
arch=(any)
url="https://fonts.google.com/specimen/Fredoka+One"
license=(OFL)
source=("$pkgname.zip::https://fonts.google.com/download?family=Fredoka+One")
sha256sums=('bd70b3c662dde03bc03a5831a2e99779da9976d0101b4fff894f6f9af5162c36')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" FredokaOne-Regular.ttf
}
