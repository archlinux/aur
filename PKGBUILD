# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-tr
pkgver=2.38
pkgrel=1
_lang=tr
pkgdesc="Turkish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('aeae6eb15335ab5f366df2b3929fe002a130ae8b0b6dd0d2dd84cabfedf073b4')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
