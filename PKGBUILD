# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgdesc='The iconic font designed for Bootstrap'
pkgver=4.0.3
pkgrel=3
pkgname='otf-font-awesome'
url='http://fortawesome.github.io/Font-Awesome/'
source=("font-awesome-${pkgver}.zip::https://github.com/FortAwesome/Font-Awesome/archive/v${pkgver}.tar.gz"
        "${pkgname}.install")
arch=('any')
install=${pkgname}.install
license=('OFL')

package() {
	install -Dm644 "${srcdir}/Font-Awesome-${pkgver}/fonts/FontAwesome.otf" \
		"$pkgdir"/usr/share/fonts/OTF/FontAwesome.otf
}

sha256sums=('6723115104dc61a8ba549296eeff9158a5946eab2ec13cfee89206f150f39880'
            '49c077164be157b829a2d8287fb83ffcfcf4b511f1bbe572efec65cd2c8f1098')
