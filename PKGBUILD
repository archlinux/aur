# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sk
pkgver=2.35
pkgrel=1
_lang=sk
pkgdesc="Slovak language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('0fc80d929764e091ab12849878a15fdf6b350191382ecfda6c97e5d3b6029b2c')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
