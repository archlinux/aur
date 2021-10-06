# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fr
pkgver=2.53.9.1
pkgrel=1
_lang=fr
pkgdesc="French language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('3e98252df93de74543ac079fa37042b4014aa1b322c9e369793202874d4c0da1eef4c97e08b5a9f8d3f89f50a00b76ffb771f717516d49934329ecff7e0c2b36')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
