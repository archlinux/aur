# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-de
pkgver=2.53.5
pkgrel=2
_lang=de
pkgdesc="German language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('428b498c2b68fe4f6f20504698c4488999778399012a65408e3389a260d97621887b375fbfde4ee986aa2af1ed99a76d8a05e575414ee72d4debe1ad82dc181e')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
