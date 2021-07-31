# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ja
pkgver=2.53.8.1
pkgrel=1
_lang=ja
pkgdesc="Japanese language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('c14fdf8595a85a852612041fb136d4497bcef9d691d6e588592dfd69e92b62f6ab701d3b4853d72159719c5e4f8bdc12c37f2bf92d5872a0d5a5112dd07ebb92')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
