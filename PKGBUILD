# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-ar
pkgver=2.46
pkgrel=1
_lang=es-AR
pkgdesc="Spanish (Argentina) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('5b7a9da73fe69c9004487f844f97f5f18d3db79e49dd151ae9a6229545ef7d2c')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
