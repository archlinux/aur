# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=14.6
pkgrel=1
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-linux'
license=('unknown')
provides=(emoji-font)
depends=()
conflicts=()
source=(AppleColorEmoji.ttf::$url/releases/download/latest/AppleColorEmoji.ttf)
sha512sums=('9d4081776da605efcfa1d325dbcea99b4ee06b17e02f8ab7803b29988714bf1561c19ddb9fdf530b60aa875925ae7258aa4eeb3a0e62f10978dadca93c45b360')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 AppleColorEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
