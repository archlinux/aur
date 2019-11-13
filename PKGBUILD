pkgname=ttf-apple-emoji
pkgver=1
pkgrel=2
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://git.auteiy.me/dmitry/appleEmojiAUR'
license=('unknown')
depends=()

source=(
AppleColorEmoji.ttf::$url/raw/v$pkgrel/AppleColorEmoji@2x.ttf
       )

sha512sums=('4c1a0fc9ba16eae645ff846143cb98ca5e5b32b45cf04e42c2d0986f3091a36682f89725129f54d26d0f4fbd055af0f5acac7883919d42578aa7f5afc95d7418')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 AppleColorEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
