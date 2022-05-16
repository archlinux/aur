# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-en-gb
pkgver=2.53.12
pkgrel=1
_lang=en-GB
pkgdesc="English (United Kingdom) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('faef8b0fa3c34c839861f04f32856c6ae294037214254e93d505715be3126f4362cd3fb3fe8c3c518f0e43bbe2d09a511fb6d4de64267482edbc3312f02887b2')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
