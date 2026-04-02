# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-it
pkgver=2.53.23
pkgrel=1
_lang=it
pkgdesc="Italian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('f2ee576e02a4a52f9a639a0772e15bd487fb465289e40f077a16b112cbef3b4641b882d286df41868126cf26efb4e90c387af62ab792f3289b57d4cfeae6368a')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
