# Maintainer: Maxim Baz <archlinux at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=8.0.0
pkgrel=2
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://www.joypixels.com/download'
arch=('any')
license=('custom')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-linux-${pkgver}.ttf::https://cdn.joypixels.com/arch-linux/font/${pkgver}/joypixels-android.ttf"
        "license-free-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/free-license.pdf"
        "license-appendix-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/appendix/joypixels-license-appendix.pdf")
sha256sums=('7c95040bebcb69676e81963ee0a82e4138f342ee85b5b8dbbad7d05d1f657eae'
            'f70f4927455b310b02caf0140592800a8357c8cdaea30493f909067212ea74ae'
            '05084e4ddbbb0c241bb0ff4e307853a9e6236fa1c617b7cba44af31b6bfc5e2d')

package() {
    install -Dm644 "joypixels-linux-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname#ttf-}/JoyPixels.ttf"
    install -Dm644 "license-free-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.pdf"
}

# vim:set ts=4 sw=4 et:
