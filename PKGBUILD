# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-public-sans
pkgver=2.000
pkgrel=1
pkgdesc='A strong, neutral typeface for interfaces, text, and headings.'
arch=('any')
url='https://public-sans.digital.gov/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.github.com/uswds/public-sans/master/LICENSE.md"
        "https://github.com/uswds/public-sans/releases/download/v${pkgver}/public-sans-v${pkgver}.zip")
sha256sums=('82f0d3cad45f264192db156360b4a710fe7060885f6aa261e6539f13cb9eb0d9'
            '3498d0ce45c230428bb171b227feabf5c13acf66e8e456c628f2d1779221ad6a')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 fonts/otf/*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
