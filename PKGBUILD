# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-hu
pkgver=2.49.2
pkgrel=1
_lang=hu
pkgdesc="Hungarian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('75102b128e373e803bbb531d1cf765b12ffd1cd21e161a257aeebcdb5f40bf25')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
