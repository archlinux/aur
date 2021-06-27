# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=palemoon-i18n-common
pkgver=29.2.0
pkgrel=1
pkgdesc="Common data for Pale Moon language packs"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
depends=("palemoon")
license=('GPL')
source=("disable-addons-installation-warning.js"
        "locale-match-os.js")
sha256sums=('61e93d46bf8b992cbcf71921039f8919eb46b49b67da593ee21dfb122cc187b7'
            '664601f9e8985bdbb534859076cf54e974f8b95f483cc2621ed21ca6902c18ab')

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/defaults/preferences"
  install -m 644 -t "${pkgdir}/usr/lib/palemoon/browser/defaults/preferences" \
    "disable-addons-installation-warning.js" \
    "locale-match-os.js"
}
