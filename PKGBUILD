# Maintainer: spider-mario <spidermario@free.fr>
pkgname=cinnxp
pkgver=1.0.2
pkgrel=1
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/498"
license=('unknown')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity')
options=('!strip')
source=("cinnxp-$pkgver.zip"::https://cinnamon-spices.linuxmint.com/uploads/themes/3FQH-80ZG-KNKW.zip)
sha512sums=('e98117649ece3a97560c0a9883f02483a949fa8381406c510ea52068fb3598b3f10da4b7720426b4f9b354c4f4552d6aa23aeb6d5130198492d1bba773fc1d6c')

package() {
	cd pkg
	cp -aR usr "$pkgdir"/usr
}
