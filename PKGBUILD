# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-ka
pkgver=2.53.23
pkgrel=1
_lang=ka
pkgdesc="Georgian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('30e13335f3fb0192965461f02ba2ce700b7ade5efe1b10f99d6907d87d135f02f93204132242d33cca971d42d1b9ae56dd59777aa8af45fa42af9692bad214c8')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
