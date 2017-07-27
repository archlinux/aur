# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-oswald
_commit='6b469e99d63da66d088ff07328a65296e6c2c9cf'
pkgver=4.003
pkgrel=1
pkgdesc='Sans-serif typeface from Google by Vernon Adams'
arch=('any')
url='https://fonts.google.com/specimen/Oswald'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'otf-oswald-ib')
source=("Oswald-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/Oswald-Bold.ttf"
        "Oswald-ExtraLight-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/Oswald-ExtraLight.ttf"
        "Oswald-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/Oswald-Light.ttf"
        "Oswald-Medium-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/Oswald-Medium.ttf"
        "Oswald-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/Oswald-Regular.ttf"
        "Oswald-SemiBold-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/Oswald-SemiBold.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/${_commit}/ofl/oswald/OFL.txt")
sha256sums=('480ee0cdcdb560f7658302917e0502fe4b839a44b628479d43ef4add9cc122ba'
            'ad06e723ab316566f8090f497b9ef13c2ba5b284898515c7264086057b1d1338'
            '848d0eab4698f1f5f2c2b2660473cfb36c4af526e183e1fa99e168a29c65d697'
            '90bd9075a2b702b9baec7d2eea4a861f4d119ce129d2773469d452e1c1b4abbb'
            'dcf58b556d15ad21c30ad4db7a2d7b8a5c1b0c89b038ee38d07b061f27f68497'
            'a3b556cc15a73aa3bc332e53708eb5004efe11c2788489c4ee8c5c3dce53265e'
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
