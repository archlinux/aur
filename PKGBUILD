# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-hu
pkgver=2.53.12
pkgrel=1
_lang=hu
pkgdesc="Hungarian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('a7541b3fb0a8311c891c5b3cbcdb1c82b571a941ba1a5c1df816dfb1faf012e106b01eb7d4a4992575fb64fb0bdd41074d771629e8781bc4ceae0ec918acd594')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
