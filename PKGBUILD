# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ru
pkgver=2.53.12
pkgrel=1
_lang=ru
pkgdesc="Russian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('2cec45b8005e255c5a55ea34f40c14d6c9d47f0c62b6ee42bc4d54d48ea995643986d66fb63a6712bce9049f273a80bfde9dece966ebecffdbcae0521fc437b2')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
