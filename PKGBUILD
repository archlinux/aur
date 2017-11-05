# Maintainer: David Runge <dave@sleepmap.de>

_plugin_name=saka_key
_id=750543
pkgname=firefox-saka-key
pkgver=1.25.2
pkgrel=1
pkgdesc="A keyboard interface to the web."
arch=('any')
license=('MIT')
url="https://github.com/lusakasa/saka-key"
depends=('firefox')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_id}/${_plugin_name}-${pkgver}-an+fx.xpi"
        "https://raw.githubusercontent.com/lusakasa/saka-key/master/LICENSE")
sha512sums=('ebf8958a883ed6146d699c484804d20055f5c7f002fd8995e00c7866516373a933b4d1f16408b9a858e1745588531ada97e392801b60393d3f3b2401e4a8ac9d'
            'f6fdb76e686c4c419fd3e5216cdb9e145907ff271ad5a780bce387f6b9f4a8eb9f176fc453fe6bf19f343bb41c4c9b41640dc7d016908e24f9ccb84f72366208')

package() {
  install -Dm644 "${_plugin_name}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{46104586-98c3-407e-a349-290c9ff3594d}.xpi"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/firefox-saka-key/LICENSE"
}
