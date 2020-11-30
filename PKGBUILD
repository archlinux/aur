# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-en-gb
pkgver=2.53.5
pkgrel=2
_lang=en-GB
pkgdesc="English (United Kingdom) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('a92bdcaee91ab6e8469df6b2d04be94d06fc4a1f7a9c0fcd89d9f81aa744e51d8fbc5af2f73003c002feb91781de7e307f85cc5844fe64a6648392466b9c2e3f')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
