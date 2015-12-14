# Maintainer: spider-mario <spidermario@free.fr>
pkgname=cinnxp
pkgver=1.0
pkgrel=1
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/498"
license=('unknown')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity')
options=('!strip')
source=("cinnxp-$pkgver.zip"::http://cinnamon-spices.linuxmint.com/uploads/themes/FPGJ-I2GG-KO2B.zip)
sha512sums=('d5db211f5278a1272a60045e389024755f29a67cc666c3173d2b788099d803bb3674a3af300d468cffaa0d4d2c1d41a09df6944ce4176d72640b32a91446c77f')

package() {
	cd CinnXP
	cp -aR usr "$pkgdir"/usr
}
