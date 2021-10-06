# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nb-no
pkgver=2.53.9.1
pkgrel=1
_lang=nb-NO
pkgdesc="Norwegian (Bokmal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('35550f2c8c47686cec224aa60b0d3428496cb22d5a207853ff13c5a2a1b868b0e8b2d5b29f0ae418a87f3742dee6d9e943a06898a740d261912f3d3870be394a')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
