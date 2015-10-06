# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nl
pkgver=2.38
pkgrel=1
_lang=nl
pkgdesc="Dutch language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('48ec7e307fc635a170db27841d95ff9105a0e203377b11dfbaf592e01ad2b00b')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
