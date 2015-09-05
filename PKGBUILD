# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-en-gb
pkgver=2.35
pkgrel=1
_lang=en-GB
pkgdesc="English (United Kingdom) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('e3db5141e431ea31f7d1f1d5a01aa9e0499d49bda0828b4ebfc77802ee365771')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
