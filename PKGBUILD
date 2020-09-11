# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=ttf-openwebicons
pkgver=1.6.2
pkgrel=1
pkgdesc='Set of icons to show the support for the Open Web'
url='http://pfefferle.github.io/openwebicons/'
license=('custom')
arch=('any')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/pfefferle/openwebicons/archive/${pkgver}.tar.gz")

package() {
        cd "${srcdir}/openwebicons-${pkgver}"
        install -dm755 "${pkgdir}"/usr/share/fonts/TTF
        install -m644 source/openwebicons.ttf "${pkgdir}"/usr/share/fonts/TTF

        install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
sha256sums=('b4ae53a86478e0dafb3960bc94f438aa5e8203752eabeff0ad46a7d8adeaa667')
