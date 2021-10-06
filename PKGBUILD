# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-ar
pkgver=2.53.9.1
pkgrel=1
_lang=es-AR
pkgdesc="Spanish (Argentina) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('373e1870dd241ae67e3b800c1f7f6e0a64ad7411fc71a987a71b02f37945c5d4525695145b9192fecef8ade6973667f0d8f65ab1894f70af451d761020cae52a')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
