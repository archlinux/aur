# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_pkgname=mailvelope
pkgname=firefox-extension-${_pkgname}
pkgver=4.2.3
pkgrel=1
_file=3520187
pkgdesc="Secure webmail communication based on the OpenPGP standard."
license=('GPL2')
arch=('any')
url="https://www.mailvelope.com"
depends=("firefox")
source=("${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/${_pkgname}-${pkgver}-fx.xpi")

noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('e3e9a09354f03b35426bf48f134553b13199170fa2583eef4a6098da616e8f4e')

package() {
  cd "${srcdir}"
  _extension_id="jid1-AQqSMBYb0a8ADg@jetpack"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_pkgname}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

# https://addons.mozilla.org/firefox/downloads/file/3444849/mailvelope-4.2.0-fx.xpi?src=dp-btn-primary
