# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nl
pkgver=2.53.5
pkgrel=2
_lang=nl
pkgdesc="Dutch language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('07e1c85f2d2a8be2f313c29d2627d8dd52fd53961917b64b9c827bedf16e3a0e4f88823cf0f00423632463de6535891792b8be1c915d6227406f775166226e54')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
