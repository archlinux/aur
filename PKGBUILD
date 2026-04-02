# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-pt-br
pkgver=2.53.23
pkgrel=1
_lang=pt-BR
pkgdesc="Portuguese (Brazilian) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('28a779503eb61ef4d0171b763aca9c6b1a88e9713c572f6ef069f57940b85a45cd257661512ee1cfbf3220af39a4c8132155ff4f45b3367ac1a628521e6cfff3')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
