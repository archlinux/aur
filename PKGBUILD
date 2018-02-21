# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pt-pt
pkgver=2.49.2
pkgrel=1
_lang=pt-PT
pkgdesc="Portuguese (Portugal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('23b3c609a7b3a91de05b4d0dabcbf9505d30ac9eb3cc326f04b928c71df5247d')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
