# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-hu
pkgver=2.53.5
pkgrel=2
_lang=hu
pkgdesc="Hungarian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('240e45508110dbc94d5cab61d4c6d49d155e68990d7972a660ea20705070dec03305421c6f33f97cd183fe1ee04164faa676491735c5694e7f70892cc354e82a')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
