# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-fixed-ss16
pkgver=34.7.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/PkgTTF-IosevkaFixedSS16-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('26e88d3a385aee6b06ef635199f03a0d18cc6e7c00a7ab7df653f6421df674e5'
            '4ba53c7c1cb39279aae5f8d7d22054c485c71169920e5a36ed098b115e2e3c5d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
