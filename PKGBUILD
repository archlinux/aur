# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pl
pkgver=2.53.5
pkgrel=2
_lang=pl
pkgdesc="Polish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('301af19fa2cd025179ed4c791351cb460e648973c3a2348c14cc4ffdbf463925c03105d6ada8073d5c5a0b131461d776b3bb926f7d2592442448292ebd35809c')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
