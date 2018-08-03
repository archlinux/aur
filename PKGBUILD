# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nb-no
pkgver=2.49.4
pkgrel=1
_lang=nb-NO
pkgdesc="Norwegian (Bokmal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('3d1cbb0299224a45d0ef08b8603c1a54a49ad98f5600fc6d9c4bcf2edda87a52')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
