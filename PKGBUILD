# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sk
pkgver=2.49.3
pkgrel=1
_lang=sk
pkgdesc="Slovak language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('794831306e1c5ac3319e8bffc7bb26916c9b7b0235ee1356fabdc066f8cbc372')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
