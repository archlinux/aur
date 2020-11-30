# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sv-se
pkgver=2.53.5
pkgrel=2
_lang=sv-SE
pkgdesc="Swedish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('eb4ec3f31e51cfc5cc0fb506dd3236024be57b1c67f2e19c4f8b480a78d156694d2d2e5faca8d3a191b54dbd21dbf165ba0e098afc02977d18037f49a04a24d9')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
