# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss09-super
pkgver=30.1.2
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/SuperTTC-IosevkaSS09-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('db4a0c7dcc409dc7b7e154e13ae01d413e7a46ba1c9fc6cb6dff3058bee7b34a'
            '8c914a5c7d8d5e5be1ae07fd8591b437ece15b665f6ccc913cea050ffa8448f7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
