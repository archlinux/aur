# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.23.2.72'
pkgrel=1
pkgdesc='TrueType WhatsApp emoji'
arch=('any')
url='https://github.com/dmlls/whatsapp-emoji-linux'
license=('unknown')
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
    WhatsAppEmoji.ttf::$url/releases/download/2.23.2.72-1/WhatsAppEmoji.ttf
)

sha512sums=('9e484f5644c9c0acc70688fda7616c6e58f8023e8136990e7b39a2af72ae0b37ab1eb115826715ac12706d346b1662e83093d4e85d8851c78b5b09d972bc737f')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

