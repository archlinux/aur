# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ru
pkgver=2.53.8.1
pkgrel=1
_lang=ru
pkgdesc="Russian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('2656e16a77300d5066b94ed70efefef6ae74fe043167a1727d9f446a2c809b4f745d70b66abc7449c3e645d2c8cd02ec4250906e9e009ad3a8bd55070007cc18')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
