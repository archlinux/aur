# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-en-us
pkgver=2.53.23
pkgrel=1
_lang=en-US
pkgdesc="English (US) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('a3950be761f9522126e649fd8a4bf1047b6b75787457ef83a4b18b4c12a0aa69a56921e0ef6d3410cc0ff7c4ab54a83ec94c7cfc170617fa89e470d39c4b98cb')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
