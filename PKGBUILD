# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-hu
pkgver=2.53.9.1
pkgrel=1
_lang=hu
pkgdesc="Hungarian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('b9ad20a96c6d832a946425b59d4de9913f8afdbedff6435918dde55bb3293b802091026e36711a0ad036fb18beb61b5ac522ebef3a536212b7653eab0fe657fb')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
