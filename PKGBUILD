# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ja
pkgver=2.53.12
pkgrel=1
_lang=ja
pkgdesc="Japanese language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('83e000114775c773e782cf0c2cb0b02a410cef8e1a8fc37c59ca1bd5b975edfd2c330da448080ee90927d23f20884daa12a1ea6942b0991dad15f68b927ac2c2')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
