# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-lt
pkgver=2.49.3
pkgrel=1
_lang=lt
pkgdesc="Lithuanian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('eaa111e36cf541f60cc88f29728cfd142fbe21fdb908742ab5292827b9e0c1e4')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
