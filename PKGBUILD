# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-merriweather
_commit='f397fbd6b930944cc6255d4771142b07110357f4'
pkgver=1.585
pkgrel=1
epoch=1
pkgdesc='A typeface that is pleasant to read on screens by Sorkin Type Co'
arch=('any')
url='http://sorkintype.com/'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'ttf-merriweather-ib')
source=("Merriweather-Black-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-Black.ttf"
        "Merriweather-BlackItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-BlackItalic.ttf"
        "Merriweather-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-Bold.ttf"
        "Merriweather-BoldItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-BoldItalic.ttf"
        "Merriweather-Italic-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-Italic.ttf"
        "Merriweather-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-Light.ttf"
        "Merriweather-LightItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-LightItalic.ttf"
        "Merriweather-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/Merriweather-Regular.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/${_commit}/ofl/merriweather/OFL.txt")
sha256sums=('e27c601a95672f2c1c2ca4456d42a4f3b4b3df851f1cd37762de269734c3668a'
            '99bb8d599887d14c86cb362945879f430dd901464239320088ccf65c5dbecf98'
            '42a20efeb90321fcb1f52eece95252fab023ab68d919123783399ec55dac82d6'
            '0f67952dfc62aed80e3507edde05a70ea1123225a4828dc4377323c25d349dd6'
            '18ce2e027971190b2ed22b515b3005f326aa8f740cb015d1339bcd4ccc09af2b'
            '290405c44ab2136698ec369d7b8f08de679add62f6e93afd7c7b0db15b0f778e'
            'ef67327f6bc3bd87237c8f1e2fedc42b3f417718c7b0d4e6500f90314eae12d8'
            'b96cf372e58cf65f0d2b71f63c13d4612bdd92bd69a2528c2df139a702387163'
            'a66f32f6cb05795b28fea487250d7616274178dcbb946ec198e9f8ef5b30cbc2')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Merriweather-Black-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-Black.ttf"
  install -m 644 Merriweather-BlackItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-BlackItalic.ttf"
  install -m 644 Merriweather-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-Bold.ttf"
  install -m 644 Merriweather-BoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-BoldItalic.ttf"
  install -m 644 Merriweather-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-Italic.ttf"
  install -m 644 Merriweather-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-Light.ttf"
  install -m 644 Merriweather-LightItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-LightItalic.ttf"
  install -m 644 Merriweather-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Merriweather-Regular.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
