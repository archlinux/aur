# Maintainer: Diego Miguel <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.21.23.23'
pkgrel=4
pkgdesc='TrueType WhatsApp emoji'
arch=('any')
url='https://github.com/dmlls/whatsapp-emoji-linux'
license=('Apache')
depends=()
provides=(emoji-font)
conflicts=(
    'noto-fonts-emoji'
    'ttf-symbola'
    'ttf-joypixels'
    'ttf-twemoji-color'
    'ttf-apple-emoji'
)

source=(
    WhatsAppEmoji.ttf::$url/releases/download/latest/WhatsAppEmoji.ttf
)

sha256sums=('b7de22f820bcd2458a0ac4706d2cddab50bbed584d37a85029c65c3b159ddebc')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

