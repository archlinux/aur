# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-sv-se
pkgver=2.53.23
pkgrel=1
_lang=sv-SE
pkgdesc="Swedish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('235986bbb7617663aec1e9f8b8317c5783a519dcd58b2d0ef6e6021bd6026ed50488ef241a2e53d0785e8af0effa611805a6554d33531b027d1326b6168fdf23')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
