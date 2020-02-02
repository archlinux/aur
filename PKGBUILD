pkgname=ttf-apple-emoji-patched
pkgver=1
pkgrel=2
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji, patched to use with "ttf-dejavu" and "noto-fonts"'
arch=("any")
url='https://git.auteiy.me/dmitry/appleEmojiAUR'
provides=(emoji-font)
depends=("ttf-dejavu-emojiless")
conflicts=(
"noto-fonts-emoji"
"ttf-symbola"
"ttf-joypixels"
"ttf-twemoji-color"
)

source=(
AppleColorEmoji.ttc::$url/raw/v$pkgrel/Apple%20Color%20Emoji.ttc
       )

sha512sums=('2ba06969f12b5450e8c040bbc61e8880869ec754839634afe834a459b324dca617b28d36ad9b244057e011f27108bee48b7373c9e77c6859aae751589f122a0d')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTC"
        install -m 644 AppleColorEmoji.ttc "${pkgdir}/usr/share/fonts/TTC/"
}
