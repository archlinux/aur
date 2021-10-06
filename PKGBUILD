# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-ru
pkgver=2.53.9.1
pkgrel=1
_lang=ru
pkgdesc="Russian language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('4e5172b353d8c603be69324dfa0d8e3e7fc03196e35841d13b1c935ade0f0989f7e01af80e23fd4ee9b4fe162cf56500b443ec0acdeb9df7808ab943a74141f4')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
