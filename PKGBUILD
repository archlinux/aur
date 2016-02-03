# Maintainer: spider-mario <spidermario@free.fr>
pkgname=cinnxp
pkgver=1.0.1
pkgrel=1
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/498"
license=('unknown')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity')
options=('!strip')
source=("cinnxp-$pkgver.zip"::http://cinnamon-spices.linuxmint.com/uploads/themes/T23T-QY33-95V1.zip)
sha512sums=('7bfd1691261dacfbac47f0d7b39512df1f4996b59ee620caf8543f9ac9b252b75819d2980558f54b1e0321efc8f31ab705b553901df15ef264b8ec596165dbf2')

package() {
	cd CinnXP
	cp -aR usr "$pkgdir"/usr
}
