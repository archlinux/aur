# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-gelasio-ib
_commit='c8d8cdf457f35474540c8bc2a349fc88f1053f70'
pkgver=0.1
pkgrel=1
pkgdesc='Gelasio is designed to be metrics compatible with Georgia'
arch=('any')
url='http://sorkintype.com/'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=()
source=("Gelasio-Bold-${pkgver}.ttf::https://github.com/tylerswagar/ttf-gelasio/raw/${_commit}/Gelasio-Bold.ttf"
        "Gelasio-BoldItalic-${pkgver}.ttf::https://github.com/tylerswagar/ttf-gelasio/raw/${_commit}/Gelasio-BoldItalic.ttf"
        "Gelasio-Italic-${pkgver}.ttf::https://github.com/tylerswagar/ttf-gelasio/raw/${_commit}/Gelasio-Italic.ttf"
        "Gelasio-Regular-${pkgver}.ttf::https://github.com/tylerswagar/ttf-gelasio/raw/${_commit}/Gelasio-Regular.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/tylerswagar/ttf-gelasio/raw/${_commit}/OFL.txt")
sha256sums=('e8b793ff02a65fd6a7aa3a728ec107702652eded8725e6358e88b53af34f94c5'
            'cb06803d9b91dbab6d757d07ee454ff7a0c61961f73f53ddc09843596700d0eb'
            '04570e56772c08bc7deffdfe148627a027490594dfe3eebda33c5708223dbd1e'
            '125d54b532529889d8e3b5cb774190b1e67e8e8a760908269e6318d97157aaa1'
            '59afa72fbde4b1d5cedd9e0897b13f0fe4adcdb5059ece055d3fe18f5a2b371b')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Gelasio-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Bold.ttf"
  install -m 644 Gelasio-BoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-BoldItalic.ttf"
  install -m 644 Gelasio-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Italic.ttf"
  install -m 644 Gelasio-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Regular.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
