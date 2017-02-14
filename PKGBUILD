# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-oswald
pkgver=4.001
pkgrel=1
pkgdesc='Sans-serif typeface from Google by Vernon Adams'
arch=('any')
url='https://fonts.google.com/specimen/Oswald'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'otf-oswald-ib')
source=("Oswald-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/Oswald-Bold.ttf"
        "Oswald-ExtraLight-${pkgver}.ttf::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/Oswald-ExtraLight.ttf"
        "Oswald-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/Oswald-Light.ttf"
        "Oswald-Medium-${pkgver}.ttf::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/Oswald-Medium.ttf"
        "Oswald-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/Oswald-Regular.ttf"
        "Oswald-SemiBold-${pkgver}.ttf::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/Oswald-SemiBold.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/1f813c20622b89489ad4c98fddf000ef9bce9420/ofl/oswald/OFL.txt")
sha256sums=('a132cf257ea787454a1cff60c482babb467ff1dce161b129300cd59b3ec64163'
            'a1ed647ab58ddd2a747738bfd950a87123aa76e2769322a6224fc15dac3b20e8'
            'b4f90c91fbf8da0a02842ccdffcf6a1a2434d2702bc74bf90407f364b0122695'
            'b15009f650d552895bac690f6293495d4c8c1ad34e80901b1fc8901cc502a073'
            '9580184a1c067b8956bde91a042c92b55ad5ea8dbeec264d5e500228c11de8ee'
            '7b42f33c7b4aec067ec396d0294d21e5c39e7c1b6c47f246356b1a6f0424e2bd'
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
