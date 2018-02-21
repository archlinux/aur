# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pl
pkgver=2.49.2
pkgrel=1
_lang=pl
pkgdesc="Polish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('2a972ae25bd7a5d2ffcb191425bb3fc7b527f4069b9c426fea9c473563125fca')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
