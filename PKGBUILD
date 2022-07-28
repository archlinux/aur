# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=7.0.0
pkgrel=1
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://www.joypixels.com/download'
arch=('any')
license=('custom')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-linux-${pkgver}.ttf::https://cdn.joypixels.com/arch-linux/font/${pkgver}/joypixels-android.ttf"
        "license-free-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/license/free-license.pdf"
        "license-appendix-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/appendix/joypixels-license-appendix.pdf")
sha256sums=('ad28df711c496bf5d84e1511379762162eef3a585ebf0bea256ba11f7309acd7'
            'f98c05ac7ea2ee47468f7a43816205bbf2bd614898cf0e431554de6ad48a4526'
            '05084e4ddbbb0c241bb0ff4e307853a9e6236fa1c617b7cba44af31b6bfc5e2d')

package() {
    install -Dm644 "joypixels-linux-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname#ttf-}/JoyPixels.ttf"
    install -Dm644 "license-free-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.pdf"
}

# vim:set ts=4 sw=4 et:
