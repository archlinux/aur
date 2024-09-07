# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-fixed-ss01
pkgver=31.6.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/PkgTTF-IosevkaFixedSS01-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('3856cc308ee0c16067a40e4a16a9fc943c1c964f8c19df6b260617fbcffe8add'
            '8c914a5c7d8d5e5be1ae07fd8591b437ece15b665f6ccc913cea050ffa8448f7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
