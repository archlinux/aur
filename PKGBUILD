# Maintainer: Diego Miguel <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.21.23.23'
pkgrel=3
pkgdesc='TrueType WhatsApp emojis'
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

sha256sums=('3375d4bdcd42f7392088fd8afc341d1d7dcdbba9068e950840d58ff63e2aabd5')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

