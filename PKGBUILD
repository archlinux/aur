# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-it
pkgver=2.35
pkgrel=1
_lang=it
pkgdesc="Italian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('0e6f3c94ba8ab8a6a87655ef4b465fed1dc82c7e6309a8c3e48545e22de3b6cb')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
