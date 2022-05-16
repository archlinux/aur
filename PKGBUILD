# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-es
pkgver=2.53.12
pkgrel=1
_lang=es-ES
pkgdesc="Spanish (Spain) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('8eec5fe40daf43a85975b3b8735aeeac96450f6dc0231e03b3509a8388651232b12b6de84ea4d5b3de3b35e44ce329c315ea6bbbb577f378dd83e8b1a5cf0219')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
