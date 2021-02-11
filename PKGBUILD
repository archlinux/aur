# Maintainer: Mark Wells <mwellsa@gmail.com>
pkgname=ttf-plainblack
pkgver=1.0
pkgrel=1
pkgdesc="A blackletter font designed by Paul Lloyd."
arch=('any')
url='https://www.ffonts.net/PlainBlack-Normal.font'
license=('custom')
source=("PlainBlack-Normal.font.zip::https://www.ffonts.net/PlainBlack-Normal.font.zip"
        "LICENSE")
sha256sums=('976998ffcf228e268f219723f8bcce38a1958829dfe88221397dc7735f694126'
            '8598807eeae737b1aa99c5c727b8a960827c424993ea14f0958033e458001c9b')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 "${srcdir}/"'Embossed Black Normal.ttf' "${pkgdir}/usr/share/fonts/TTF/Embossed_Black_Normal.ttf"
    install -m 644 "${srcdir}/"'Embossed Black Wide.ttf' "${pkgdir}/usr/share/fonts/TTF/Embossed_Black_Wide.ttf"
    install -m 644 "${srcdir}/"'Incised Black.ttf' "${pkgdir}/usr/share/fonts/TTF/Incised_Black.ttf"
    install -m 644 "${srcdir}/"'Incised Black Wide.ttf' "${pkgdir}/usr/share/fonts/TTF/Incised_Black_Wide.ttf"
    install -m 644 "${srcdir}/"'Plain Black.ttf' "${pkgdir}/usr/share/fonts/TTF/Plain_Black.ttf"
    install -m 644 "${srcdir}/"'Plain Black Wide.ttf' "${pkgdir}/usr/share/fonts/TTF/Plain_Black_Wide.ttf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
