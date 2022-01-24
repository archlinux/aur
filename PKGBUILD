# Maintainer: Diego Miguel <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.21.23.23'
pkgrel=1
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

sha256sums=('9e7c230e16a04a2bc2804ec431f3c05d3d2c202b89103851b122651d0ee50d96')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

