# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss12-super
pkgver=30.3.2
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/SuperTTC-IosevkaSS12-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('d112772e1b9d6b72bb3a90cc271efe9bc00bacec43bed42d22d7b73e6156ce70'
            '8c914a5c7d8d5e5be1ae07fd8591b437ece15b665f6ccc913cea050ffa8448f7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
