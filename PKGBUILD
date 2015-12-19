# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgdesc='The iconic font designed for Bootstrap'
pkgver=4.5.0
pkgrel=1
pkgname='otf-font-awesome'
url='http://fortawesome.github.io/Font-Awesome/'
source=("font-awesome-${pkgver}.zip::https://github.com/FortAwesome/Font-Awesome/archive/v${pkgver}.tar.gz")
arch=('any')
install=${pkgname}.install
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')

package() {
	install -Dm644 "${srcdir}/Font-Awesome-${pkgver}/fonts/FontAwesome.otf" \
		"$pkgdir"/usr/share/fonts/OTF/FontAwesome.otf
}

sha256sums=('7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8')
