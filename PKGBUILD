# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-tr
pkgver=2.46
pkgrel=1
_lang=tr
pkgdesc="Turkish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('1ad81e539c119d4bcc9b4c15dc1a54d604ae8d999c3e7dbc112c2633dd914409')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
