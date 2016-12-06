# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgdesc='The iconic font designed for Bootstrap'
pkgver=4.7.0
pkgrel=1
pkgname='otf-font-awesome'
url='http://fontawesome.io'
source=("font-awesome-${pkgver}.zip::https://github.com/FortAwesome/Font-Awesome/archive/v${pkgver}.tar.gz")
arch=('any')
install=${pkgname}.install
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')

package() {
	install -Dm644 "${srcdir}/Font-Awesome-${pkgver}/fonts/FontAwesome.otf" \
		"$pkgdir"/usr/share/fonts/OTF/FontAwesome.otf
}

sha256sums=('de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43')
