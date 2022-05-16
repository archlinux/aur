# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nb-no
pkgver=2.53.12
pkgrel=1
_lang=nb-NO
pkgdesc="Norwegian (Bokmal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('ff52f8788a80cea12236295fbfcd5ec06d9f980bd6d2e1bc104834672fc55bc04f4aae18dd03f6ac2f656499c48ebed94dfe3c3da94df95ab8714645d3f1a890')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
