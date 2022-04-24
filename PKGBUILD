# Maintainer: Diego Miguel <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.22.8.79'
pkgrel=1
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
    WhatsAppEmoji.ttf::$url/releases/download/2.22.8.79-1/WhatsAppEmoji.ttf
)

sha256sums=('ce6d2046b1983ce0e28d6c8c221fac6d45097c5ab95cab1c67735b633f65ce87')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

