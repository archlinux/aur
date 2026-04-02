# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-de
pkgver=2.53.23
pkgrel=1
_lang=de
pkgdesc="German language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('153950608343d4bfc040aad71e042e7e903504deb66bfd7f59c3eb876fa6ac4231c748e91455c8a11a2e0b2798a6916da6d9401d2d0a0c102f8c2619ac6af9f9')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
