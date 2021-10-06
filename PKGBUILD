# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-es
pkgver=2.53.9.1
pkgrel=1
_lang=es-ES
pkgdesc="Spanish (Spain) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('835895d0e9b806dd9d4ea9bb1a9f9de26f451d97c1cb1c4db1671a6421cd288d46e20a409008bcf9c88dea6db3d8778aa804aa40e6d4c62ce7f19e986c5f5912')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
