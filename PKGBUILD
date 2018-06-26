# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sv-se
pkgver=2.49.3
pkgrel=1
_lang=sv-SE
pkgdesc="Swedish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('b94fde2edcba34225998deffd50d48d82dc2099468017d34fb5f6c26944ebb68')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
