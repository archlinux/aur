# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgdesc='The iconic font designed for Bootstrap'
pkgver=4.6.3
pkgrel=1
pkgname='otf-font-awesome'
url='fontawesome.io'
source=("font-awesome-${pkgver}.zip::https://github.com/FortAwesome/Font-Awesome/archive/v${pkgver}.tar.gz")
arch=('any')
install=${pkgname}.install
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')

package() {
	install -Dm644 "${srcdir}/Font-Awesome-${pkgver}/fonts/FontAwesome.otf" \
		"$pkgdir"/usr/share/fonts/OTF/FontAwesome.otf
}

sha256sums=('669fb1210c64eda3f998c86941641f1bcd0af4450643daf8841cb62d2b6c71a4')
