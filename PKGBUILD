# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-el
pkgver=2.53.23
pkgrel=1
_lang=el
pkgdesc="Greek language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('9f26576e7fcfba6013e4370b12f65e20cf14712ccb6f7004f39ced0023b19f78b586264638281a2b7b46c3f1ee64e14b8e64cd2b848b289f0a3fc2faab4d6401')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
