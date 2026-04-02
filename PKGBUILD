# Maintainer: Voxan <admin at hessfr dot fr>

pkgname=seamonkey-i18n-fr
pkgver=2.53.23
pkgrel=1
_lang=fr
pkgdesc="French language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('d5f0a5a923b767f483b24adcd4cf62aa5c5a441cb9719eb5e3bfe69dfd0ccb301fe7a0fa3f8a4506046116a2f809b63f5e87351f4b9fd3a83b9a36f399a84ec3')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
