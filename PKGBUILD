# Maintainer: Voxan <admin at hessfr dot fr>

pkgname=seamonkey-i18n-ru
pkgver=2.53.23
pkgrel=1
_lang=ru
pkgdesc="Russian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('384b5cfca9369bcdb7a81399d5fb0d31232e241d5326016b61901ebee9cf93d9025a952304645cd5f30991bcbe13001e902816be2426212c2cc4e18a275e61d4')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
