# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>

pkgname=ttf-kosugi-maru
pkgver=4.002
pkgrel=1
pkgdesc="Japanese rounded Gothic typeface"
arch=('any')
url="https://github.com/googlefonts/kosugi-maru"
license=('Apache-2.0')
_commit=bd22c671a9ffc10cc4313e6f2fd75f2b86d6b14b
source=(
  "KosugiMaru-Regular.ttf::https://raw.githubusercontent.com/googlefonts/kosugi-maru/${_commit}/fonts/ttf/KosugiMaru-Regular.ttf"
  "LICENSE.txt::https://raw.githubusercontent.com/googlefonts/kosugi-maru/${_commit}/LICENSE.txt"
)
sha256sums=('4b8d0022c8dadd090ef67cd1f71f130714767af7806cba2eb4ebe4b0271c1d68'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
  install -Dm644 KosugiMaru-Regular.ttf \
    "${pkgdir}/usr/share/fonts/TTF/KosugiMaru-Regular.ttf"
  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
