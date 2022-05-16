# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sv-se
pkgver=2.53.12
pkgrel=1
_lang=sv-SE
pkgdesc="Swedish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('a01b5065dca3f04f41a13b905e24a938d5bd8acf2092b5b0dfdf21aed70a3acc09ba6f4b76934d853294c32ab99585a20cf5be831731001930591a8b10348a3a')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
