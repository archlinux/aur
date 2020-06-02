# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-en-gb
pkgver=2.53.2
pkgrel=1
_lang=en-GB
pkgdesc="English (United Kingdom) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('31f214313f98641390086721b853b826943a6a3de4f166f0da3458780cb1761d')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
