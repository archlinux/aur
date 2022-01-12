# Maintainer: Dylan Logan

pkgname=pissjar-font
pkgver=1
pkgrel=1
pkgdesc="A typeface made of piss by the band Pissjar"
url="https://www.pissjar.com/"
arch=(any)
source=("https://www.pissjar.com/s/PissjarSans.zip")
sha512sums=('000e9b6b7009036c704adf81d43a1dcc18327f2ff88c28cd5533bed1a7eb6864bf65a006db00f5f7ed4a903c4dc5773e90575310b9aa3fda430f2bcd7a69ae54')

package() {
	install -d "$pkgdir/usr/share/fonts/pissjar"
	install -t "$pkgdir/usr/share/fonts/pissjar" -m644 Pissjar\ Sans/Pissjar\ Sans.ttf
}
