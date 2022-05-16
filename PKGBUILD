# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-ar
pkgver=2.53.12
pkgrel=1
_lang=es-AR
pkgdesc="Spanish (Argentina) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('dd422abe47a54075f323076c2da58eea90c1fd5c3671e375269c1726e3e7abe4f182ad9666d4b33c29a2f6a7cf0def6d465b64f5af132927f463a96807e61df3')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
