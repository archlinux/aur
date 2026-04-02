# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-tr
pkgver=2.53.23
pkgrel=1
_lang=tr
pkgdesc="Swedish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('013d3ebeda41e9ad56dde7ac5355a4d2da928bdf44d70aca4d7c9f4ef79a9f5c58f7650c6015636fe80523df2212c74b882e76a765d786176c0530bc6a979086')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
