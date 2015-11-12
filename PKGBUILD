# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-ar
pkgver=2.39
pkgrel=1
_lang=es-AR
pkgdesc="Spanish (Argentina) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('f9c92da4f70391413c4be4255332add2fa60a54d8e42c3205badffc4579717da')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
