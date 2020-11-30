# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-it
pkgver=2.53.5
pkgrel=2
_lang=it
pkgdesc="Italian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('90ff8fb17ea74e33250b82bd7d7105696a7108b73e16dc0acb3a8031dbc6f7fb338168076e313bab819080b386cc292bf584a8106b59a1dee5efc3069c0819d0')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
