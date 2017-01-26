# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-oswald
pkgver=4.0
pkgrel=3
pkgdesc='Sans-serif typeface from Google by Vernon Adams'
arch=('any')
url='https://fonts.google.com/specimen/Oswald'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'otf-oswald-ib')
install="${pkgname}.install"
source=("Oswald-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/Oswald-Bold.ttf"
        "Oswald-ExtraLight-${pkgver}.ttf::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/Oswald-ExtraLight.ttf"
        "Oswald-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/Oswald-Light.ttf"
        "Oswald-Medium-${pkgver}.ttf::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/Oswald-Medium.ttf"
        "Oswald-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/Oswald-Regular.ttf"
        "Oswald-SemiBold-${pkgver}.ttf::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/Oswald-SemiBold.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/59065315fa1a03925bd67c5c368867e33c7799cd/ofl/oswald/OFL.txt")
sha256sums=('31a2557166d9fe95edecdf6366c0135999d81a8aac72b13aa083068bd98c57de'
            'a75d009c53b095d18ab0416f4458b0136dbf66a4c2e40974d0dc7ae4f034a1fb'
            'f64170f3a41c8345f95ee576613058d71f21b57fa55f75b23a1596716e7e272f'
            '04a9261c6a8aa293d355e78879aa3ad85b179e710431c12cb0abaf05d6d3db23'
            '22cfdd1e22e48479992ca4a7e673a50905d5cdbc68413893d8106eb99e53e979'
            '30b8ce6f334bc354078bbd966a8d6d7c01bf6201e75b6994997ca0afd48aa5f8'
            'fac1ddc0a0264245b37fe869ffcd92befc93129633525c545dab06ae8e22aa99')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Oswald-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Oswald-Bold.ttf"
  install -m 644 Oswald-ExtraLight-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Oswald-ExtraLight.ttf"
  install -m 644 Oswald-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Oswald-Light.ttf"
  install -m 644 Oswald-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Oswald-Medium.ttf"
  install -m 644 Oswald-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Oswald-Regular.ttf"
  install -m 644 Oswald-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Oswald-SemiBold.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
