# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=otf-public-sans
pkgver=1.008
pkgrel=3
pkgdesc='A strong, neutral typeface for interfaces, text, and headings.'
arch=('any')
url='https://public-sans.digital.gov/'
license=('OFL')
source=("${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.md::https://raw.github.com/uswds/public-sans/master/LICENSE.md"
        'https://github.com/uswds/public-sans/releases/download/v1.008/public-sans-v1.008.zip')
sha256sums=('00acc4a89658f2c26f17d608f37f909ad087ade21b02759f4c221526371cf9eb'
            '12c5880048ad3f62f8b6f868142cb8b694029a037b6886788ce587babe026874')

package() {
    install -d ${pkgdir}/usr/share/fonts/OTF/
    install -m644 binaries/otf/*.otf ${pkgdir}/usr/share/fonts/OTF/
    install -D -m644 ${pkgname}-${epoch}:${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
