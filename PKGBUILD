# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-etoile
pkgver=28.0.6
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/PkgTTF-IosevkaEtoile-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('0f6a29c02c28ee2ac051eb9f165dda9d449ce6df75cd3008e305d32449fb952e'
            '8c914a5c7d8d5e5be1ae07fd8591b437ece15b665f6ccc913cea050ffa8448f7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
