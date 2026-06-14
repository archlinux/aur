# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-etoile-super
pkgver=34.6.3
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/SuperTTC-IosevkaEtoile-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('671501cd1d2b50a2aa66664507d5479369474285e65c4d70efba748c17be3bc7'
            '4ba53c7c1cb39279aae5f8d7d22054c485c71169920e5a36ed098b115e2e3c5d')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
