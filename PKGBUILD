# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pt-pt
pkgver=2.53.12
pkgrel=1
_lang=pt-PT
pkgdesc="Portuguese (Portugal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('98ac0830edca5d845d84d235da7f0f4cc4cafb8821943cdaad1f1d1c9ce193f64df47a9837436d4c228f1800a1902d33a877f9e22b795b694a7a526da87c4d62')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
