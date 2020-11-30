# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pt-br
pkgver=2.53.5
pkgrel=2
_lang=pt-BR
pkgdesc="Portuguese (Brazil) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('632dad392cf76efed21f269a2bf5a2d25a10b6d7e3814d6547969b3418360ada48f450bb51f3ff434be3406912ad2386e092ee052477b38adad517d0f2cecc11')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
