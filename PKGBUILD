# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-es-es
pkgver=2.49.1
pkgrel=1
_lang=es-ES
pkgdesc="Spanish (Spain) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha256sums=('7fce4de8e1160996af38838093710d9e8a6c9f16f1a05e1b76c2778586fb643f')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
