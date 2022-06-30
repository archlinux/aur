# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-public-sans
pkgver=2.001
pkgrel=1
pkgdesc='A strong, neutral typeface for interfaces, text, and headings.'
arch=('any')
url='https://public-sans.digital.gov/'
license=('OFL')
source=( "https://github.com/uswds/public-sans/releases/download/v${pkgver}/public-sans-v${pkgver}.zip")
sha256sums=('88cacdf7cd03b31af8f1f83e1f51e0eb5a6052565a6c014c90c385f1ff2d13a5')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 fonts/otf/*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
