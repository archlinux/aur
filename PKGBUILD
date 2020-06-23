# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=6.0.0
pkgrel=1
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://www.joypixels.com/download'
arch=('any')
license=('custom')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-android-${pkgver}.ttf::https://cdn.joypixels.com/arch-linux/font/${pkgver}/joypixels-android.ttf"
        "license-free-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/license/free-license.pdf"
        "license-appendix-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/appendix/joypixels-license-appendix.pdf")
sha256sums=('ba9c5563beb5bbaaa7185dfb1dac58b13a50d9cdf4901cc0f592bc9134d6b8ef'
            '8f778e3b81f361a69d287760cc43e5c4cadd9e2a103a80861b9ffe60c77222ac'
            '05084e4ddbbb0c241bb0ff4e307853a9e6236fa1c617b7cba44af31b6bfc5e2d')

package() {
    install -Dm644 "joypixels-android-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname#ttf-}/JoyPixels.ttf"
    install -Dm644 "license-free-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.pdf"
}

# vim:set ts=4 sw=4 et:
