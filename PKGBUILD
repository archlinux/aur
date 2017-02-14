# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-merriweather
pkgver=2.001
pkgrel=1
pkgdesc='A typeface that is pleasant to read on screens by Sorkin Type Co'
arch=('any')
url='https://fonts.google.com/specimen/Merriweather'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'ttf-merriweather-ib')
source=("Merriweather-Black-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-Black.ttf"
        "Merriweather-BlackItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-BlackItalic.ttf"
        "Merriweather-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-Bold.ttf"
        "Merriweather-BoldItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-BoldItalic.ttf"
        "Merriweather-Italic-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-Italic.ttf"
        "Merriweather-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-Light.ttf"
        "Merriweather-LightItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-LightItalic.ttf"
        "Merriweather-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/Merriweather-Regular.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/4f421f4cdb58fc933453ef5ae163f8310761cdc4/ofl/merriweather/OFL.txt")
sha256sums=('9fbb4fe2db16613f6a1a6c3fac5c16e2642abf76cbcef1fd89f62f0d25faaf65'
            '04f446a6425e5c6a019169da1c621ce3f1cb22ab43553c7f00b933080e0e5a26'
            '07c866cc42802badf0a880658041570acf606eb2525bbd26ac4db202a2e129ad'
            '8ae1576a1791e733fd1d02bc8da9a492e45b23fea224dbae098d88396068f2e5'
            '5fb616e44968f566e5bd171247d47ab08239ea11ca02d3008cbffdcc3c3e3967'
            '1ff545213d0e2b5f4c649a8122d41cc92ec4bbc97624eb58d40b4b554618d00e'
            'f24beefcf02bfbf0337d26ce79676e2324d4972809318ee90193e3c5999a5a29'
            '93fc8bdd56e2000b7dfee9e350a6c52cca1a4d546ff23b2b11ffd36879351f1d'
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
