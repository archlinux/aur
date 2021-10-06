# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-de
pkgver=2.53.9.1
pkgrel=1
_lang=de
pkgdesc="German language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('1a8bee69398fafba41c21d538828c3ff22dd21d587a7f8b452e03fce64e504887d8e2f1b369ea2ea7208a73364365e7e83ce1726ad26572365b549a0d13052b7')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
