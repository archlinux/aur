# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-public-sans
pkgver=2.001
pkgrel=1
pkgdesc='A strong, neutral typeface for interfaces, text, and headings.'
arch=('any')
url='https://public-sans.digital.gov/'
license=('OFL')
source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.github.com/uswds/public-sans/master/LICENSE.md"
        "https://github.com/uswds/public-sans/releases/download/v${pkgver}/public-sans-v${pkgver}.zip")
sha256sums=('82f0d3cad45f264192db156360b4a710fe7060885f6aa261e6539f13cb9eb0d9'
            'dd839c4436d4ffc4563517f64c47b8eae2da54e867aad3173da1bd7fef104597')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 fonts/otf/*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
