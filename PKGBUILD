# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-ar
pkgver=2.53.5
pkgrel=2
_lang=es-AR
pkgdesc="Spanish (Argentina) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('9f4c8b45a4342cf32751a99f43b60493eba2d1accb1fadeb4611521d9e90f39f40764c8ffa3665956ed2e565b0d88bd309c766c00a5e87ba8c3409607646aa9c')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
