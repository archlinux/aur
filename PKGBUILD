# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-sk
pkgver=2.53.23
pkgrel=1
_lang=sk
pkgdesc="Slovak language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('863a2523b399e8a8e7b0ea1dabcd890fe130e88bbba4364a3473d597589f1396535b6b848880f540a7ea122b78d9e19ceeb25a84f88afdb626a23ed97972259e')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
