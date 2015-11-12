# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ca
pkgver=2.39
pkgrel=1
_lang=ca
pkgdesc="Catalan language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('7cd996abf7027189f6c3fd09501331b1bcf06a61f596cd7042d2a2a66b58e0e2')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
