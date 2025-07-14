# Maintainer: Aaron Blasko <blaskoazzolaaaron@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=9.0.0
pkgrel=1
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://www.joypixels.com/download'
arch=('any')
license=('custom')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-linux-${pkgver}.ttf::https://cdn.joypixels.com/distributions/gentoo-linux/font/${pkgver}/joypixels-android.ttf"
        "license-free-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/free-license.pdf"
        "license-appendix-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/appendix/joypixels-license-appendix.pdf")
sha256sums=('a661ac5606122bf7393a584e5e1365441b3f5e9a4c5e6b0771979298892e103e'
            'b8572500ff2ff25387c9a1f51f2f122215a881ebcf723adddf09fa347b3e64e6'
            '05084e4ddbbb0c241bb0ff4e307853a9e6236fa1c617b7cba44af31b6bfc5e2d')

package() {
    install -Dm644 "joypixels-linux-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname#ttf-}/JoyPixels.ttf"
    install -Dm644 "license-free-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.pdf"
}

# vim:set ts=4 sw=4 et:
