# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=ttf-sawarabi-mincho
epoch=1
pkgver=1.082
pkgrel=1
pkgdesc="Japanese Mincho typeface with braille glyphs"
url="https://github.com/googlefonts/sawarabi-mincho"
license=('OFL-1.1')
arch=('any')
source=("https://github.com/googlefonts/sawarabi-mincho/releases/download/v${pkgver}/sawarabi-mincho-v${pkgver}.zip")
sha256sums=('c2da6110a0c3f9265a2b1edd6f6757e40be480b5f5792002750fdf4e9ee5f89a')

package() {
  cd "sawarabi-mincho-v${pkgver}"

  install -Dm644 fonts/ttf/SawarabiMincho-Regular.ttf \
    "${pkgdir}/usr/share/fonts/TTF/SawarabiMincho-Regular.ttf"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
