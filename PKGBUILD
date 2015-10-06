# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-lt
pkgver=2.38
pkgrel=1
_lang=lt
pkgdesc="Lithuanian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('785c4680eb1ef4a560cdd925edf1773067f26e80218c56db90d4179ad5a123e6')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
