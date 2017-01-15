# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-oswald
pkgver=4.0
pkgrel=2
pkgdesc='Sans-serif typeface from Google by Vernon Adams'
arch=('any')
url='https://fonts.google.com/specimen/Oswald'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'otf-oswald-ib')
install="${pkgname}.install"
source=('https://github.com/google/fonts/raw/master/ofl/oswald/Oswald-Bold.ttf'
        'https://github.com/google/fonts/raw/master/ofl/oswald/Oswald-ExtraLight.ttf'
        'https://github.com/google/fonts/raw/master/ofl/oswald/Oswald-Light.ttf'
        'https://github.com/google/fonts/raw/master/ofl/oswald/Oswald-Medium.ttf'
        'https://github.com/google/fonts/raw/master/ofl/oswald/Oswald-Regular.ttf'
        'https://github.com/google/fonts/raw/master/ofl/oswald/Oswald-SemiBold.ttf'
        'https://github.com/google/fonts/raw/master/ofl/oswald/OFL.txt')
sha256sums=('31a2557166d9fe95edecdf6366c0135999d81a8aac72b13aa083068bd98c57de'
            'a75d009c53b095d18ab0416f4458b0136dbf66a4c2e40974d0dc7ae4f034a1fb'
            'f64170f3a41c8345f95ee576613058d71f21b57fa55f75b23a1596716e7e272f'
            '04a9261c6a8aa293d355e78879aa3ad85b179e710431c12cb0abaf05d6d3db23'
            '22cfdd1e22e48479992ca4a7e673a50905d5cdbc68413893d8106eb99e53e979'
            '30b8ce6f334bc354078bbd966a8d6d7c01bf6201e75b6994997ca0afd48aa5f8'
            'SKIP')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 *.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
