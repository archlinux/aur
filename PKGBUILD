# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-es
pkgver=2.35
pkgrel=1
_lang=es-ES
pkgdesc="Spanish (Spain) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('c242cfb3406ad6048d7f855e22afdb58bd4d6f8d918eb2e96ddfcf64a0b445ad')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
