# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-lt
pkgver=2.35
pkgrel=1
_lang=lt
pkgdesc="Lithuanian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('6fcc9f475ba069f58fc8685ee4b45c9937c3cff93227bde15fca92ccd3729300')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
