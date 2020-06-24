# Maintainer: Dmitry <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=1
pkgrel=13
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://gitlab.com/ykkzde/AUR'
license=('unknown')
provides=(emoji-font)
depends=()
conflicts=(
'noto-fonts-emoji' 
'ttf-symbola'
'ttf-joypixels'
'ttf-twemoji-color'
)

source=(
    apple-color-emoji.ttc::$url/-/raw/master/files/$pkgname/apple-color-emoji.ttc
       )

sha512sums=('2ba06969f12b5450e8c040bbc61e8880869ec754839634afe834a459b324dca617b28d36ad9b244057e011f27108bee48b7373c9e77c6859aae751589f122a0d')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTC"
        install -m 644 apple-color-emoji.ttc "${pkgdir}/usr/share/fonts/TTC/"
}
