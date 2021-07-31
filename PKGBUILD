# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pl
pkgver=2.53.8.1
pkgrel=1
_lang=pl
pkgdesc="Polish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('d2539c855ba9d15f77b7aecbae346c91ff15128744be7943c7b76c73b0224438232cf462b14394a33ba3f03ffbffedc9f5e1715250853a0a7564e1ea753a1b80')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
