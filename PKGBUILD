# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-zh-tw
pkgver=2.53.23
pkgrel=1
_lang=zh-TW
pkgdesc="Chinese (Traditional) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('8152cb8f0982521a9d7cb595928afef6833d2576a88b61f156e45d77cf0f999d5e5452342198afdef838ccfea984fc2099c7cbf89b6bdd8f8eced9ffe31cceaf')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
