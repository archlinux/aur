# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgbase=kosugi-font
pkgname=(ttf-kosugi otf-kosugi)
pkgver=4.001
pkgrel=1
pkgdesc="Kosugi fonts, originally by Motoya"
arch=('any')
url="https://github.com/googlefonts/kosugi"
license=('Apache-2.0')
_commit=75171a2738135ab888549e76a9037e826094f0ce
source=(
  "Kosugi-Regular.ttf::https://raw.githubusercontent.com/googlefonts/kosugi/${_commit}/fonts/ttf/Kosugi-Regular.ttf"
  "Kosugi-Regular.otf::https://raw.githubusercontent.com/googlefonts/kosugi/${_commit}/fonts/otf/Kosugi-Regular.otf"
  "LICENSE.txt::https://raw.githubusercontent.com/googlefonts/kosugi/${_commit}/LICENSE.txt"
)
sha256sums=('f5e81d6a6b865d9b88c54d2d3c16bcaa3b239dfcefaf2a62976ac9dc7574bab7'
            '85c0300e520fb6548729dba19c6b19463d19e84f8ef7e34ee844f052955e9631'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package_ttf-kosugi() {
  install -Dm644 Kosugi-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/Kosugi-Regular.ttf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_otf-kosugi() {
  install -Dm644 Kosugi-Regular.otf "${pkgdir}/usr/share/fonts/OTF/Kosugi-Regular.otf"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
