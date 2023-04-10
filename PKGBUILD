# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=16.4
pkgrel=1
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-linux'
license=('unknown')
provides=(emoji-font)
depends=()
conflicts=(
    'noto-fonts-emoji'
    'ttf-symbola'
    'ttf-joypixels'
    'ttf-twemoji-color'
    'ttf-whatsapp-emoji'
)

source=(
    AppleColorEmoji.ttf::$url/releases/download/v16.4/AppleColorEmoji.ttf
)

sha512sums=('50922283b9621616c336b40d5f49e42a0ee4e9b9ef9925ef8e23a705f36a747563df07dc09e45c72c0aaa3098b921b56721e797786c61c15e08e1afcb8201df0')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 AppleColorEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

