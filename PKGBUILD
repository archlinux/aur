# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pt-br
pkgver=2.53.8.1
pkgrel=1
_lang=pt-BR
pkgdesc="Portuguese (Brazil) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('d1ba023e4a1de19538a89d43d5c91806b149099c56687394dfcb0f73a0e3fda198ed26c148e7e8442d091b2c4c8091c14a17b5a3becac7af2e6744e9556460c5')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
