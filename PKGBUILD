# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ja
pkgver=2.53.5
pkgrel=2
_lang=ja
pkgdesc="Japanese language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('3f8d82467d908406ef233fddd6840d9344a4caf60d8ecfb21d42020fc7e4f9d984d68c45f92b1025d5c8188ce1fe267b63cd279d89433fc0b1d7f3d34820e199')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
