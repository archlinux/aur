# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-it
pkgver=2.53.12
pkgrel=1
_lang=it
pkgdesc="Italian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('e20c089de0d55ca9c2cfa48bb84e6e198bae9bef14bfac643b14338f2091eaaf9c949aa1119fe9ddfbce84007deebe0483afb9942dfe0411199857f6aabf801f')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
