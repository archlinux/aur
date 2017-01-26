# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-merriweather
pkgver=2.000
pkgrel=2
pkgdesc='A typeface that is pleasant to read on screens by Sorkin Type Co'
arch=('any')
url='https://fonts.google.com/specimen/Merriweather'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts-opinionated-git' 'ttf-merriweather-ib')
install="${pkgname}.install"
source=("Merriweather-Black-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-Black.ttf"
        "Merriweather-BlackItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-BlackItalic.ttf"
        "Merriweather-Bold-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-Bold.ttf"
        "Merriweather-BoldItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-BoldItalic.ttf"
        "Merriweather-Italic-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-Italic.ttf"
        "Merriweather-Light-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-Light.ttf"
        "Merriweather-LightItalic-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-LightItalic.ttf"
        "Merriweather-Regular-${pkgver}.ttf::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/Merriweather-Regular.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/google/fonts/raw/9e05c7347870f8e27a4a293a0df006939c4ddda2/ofl/merriweather/OFL.txt")
sha256sums=('5350971f435ee4799fbd96e8d4208c177cf468f13e52a5bafabca8933890712b'
            'c1b73033f0356ecd5362796b391a50c9683bd6bb826429e33b4288dee29636c6'
            '3b8c53954df2c0b0f47c417cb577423249da5f9cd21fd0e34e403ee0e6ec3eea'
            '0025097606d3ae5a85abddec77539cb9d55397a2cb2e88ea95c479ea12101288'
            'e7eea495c8745af73e03b7973f5002006860a991a2c2f213bf690a2276972d01'
            '0ff2d78185d096bed3098a171f887b678caab9b143cd81f472c0074dd57a365f'
            '8321208fe77f710d3f7429ba5a7c4873bd9374a361ca8d758a9ff4869aa412c1'
            'f593e9a01036386e34386e9dbec0824544e591569df649f19c9a8817f6227926'
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
