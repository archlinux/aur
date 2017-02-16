# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-oswald
pkgver=4.002
pkgrel=1
pkgdesc='Sans-serif typeface from Google by Vernon Adams'
arch=('any')
url='https://fonts.google.com/specimen/Oswald'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'otf-oswald-ib')
source=("Oswald-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/Oswald-Bold.ttf"
        "Oswald-ExtraLight-${pkgver}.ttf::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/Oswald-ExtraLight.ttf"
        "Oswald-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/Oswald-Light.ttf"
        "Oswald-Medium-${pkgver}.ttf::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/Oswald-Medium.ttf"
        "Oswald-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/Oswald-Regular.ttf"
        "Oswald-SemiBold-${pkgver}.ttf::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/Oswald-SemiBold.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/5209d4cc57eca34da2e44737f95123604556e591/ofl/oswald/OFL.txt")
sha256sums=('28e94e414c2ea0d2737da6e84e365c32dcfd09f2bfbda462d423a1acc631bab7'
            'b37a9470920d1ce7239bed62fcec385df35a8c6cdf9c599f378f9a06fcc2b638'
            '29205b8c745a797c26668dd7dcb278e5b4229243f1f2c1e4a17d1e650436da07'
            '5bea277ea02e090fe67391a4ebe8f0537e7c5392ccb56f3a3546b3492f4a7987'
            'd680c432a29b6f5d3080d9028027cfc33406d07230030e81b89a42d2e6aea541'
            '242aff7abe692ac637ec2fde70efe395f2a07c5b990f47741730f9230087ad02'
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
