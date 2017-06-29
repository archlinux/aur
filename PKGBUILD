# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ja
pkgver=2.46
pkgrel=1
_lang=ja
pkgdesc="Japanese language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('b3f8a0e23cbd3e235d33d1fb083ff6b5b4d0abdd4697d89be444f90e657afea5')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
