# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-en-gb
pkgver=2.38
pkgrel=1
_lang=en-GB
pkgdesc="English (United Kingdom) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('c689322d29fb63c801e08463745fbbb8cdda35a5ec9d78f8499b5d8522cb58ba')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
