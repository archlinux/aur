# Maintainer: Diego Miguel <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.21.23.23'
pkgrel=2
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

sha256sums=('b29953f354c5b57f7937172aef9d89cc25d66d8d489587126ea252b9c24045b0')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

