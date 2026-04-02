# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-zh-cn
pkgver=2.53.23
pkgrel=1
_lang=zh-CN
pkgdesc="Chinese (Simplified) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('e15bbf2a95e05ae6ae1325aba50febb2bdf8fbe950ce050d9d2e0f5eecaf889e0199f81f09c6ee6c3b85ca9230c1ce5cb6f23ec197c1694d38097b43a7613a1b')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
