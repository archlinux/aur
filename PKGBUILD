# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ca
pkgver=2.35
pkgrel=1
_lang=ca
pkgdesc="Catalan language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('6b6bc56a6f780f18a8736a554fcec9b042ff8c3a4ecbef9d192d3ad6a67ed150')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
