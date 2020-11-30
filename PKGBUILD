# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-es
pkgver=2.53.5
pkgrel=2
_lang=es-ES
pkgdesc="Spanish (Spain) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('7c694d104cda75d2df1bba7856e3f96d59001a8e37af29d76a0541bab172720303ede9f121aab617ad6302f077f38ed8db1549384e314a3f4a51ff815c63788d')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
