# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nl
pkgver=2.53.9.1
pkgrel=1
_lang=nl
pkgdesc="Dutch language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('909bf7bb4cf877e8cc382a2e45d864764de0259b818b86fa7dafc54e229842bbb69907b990fa3a34ca4450db090c0059a9b7390dcc1b00044c2fcb3638608806')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
