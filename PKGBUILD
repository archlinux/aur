# Maintainer: Dmitry <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=1
pkgrel=15
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
)

source=(
    AppleColorEmoji.ttf::$url/releases/download/latest/AppleColorEmoji.ttf
       )

sha512sums=('0e3133c33c9ad27448b07aa8c7d1f7d8b974d74f7f5d1fa285e622d10672429ed9cee13a9dd29624e4b3c3b1c7af8f24503b11577d8356af8d6c5a8ed24e531b')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
        install -m 644 AppleColorEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
