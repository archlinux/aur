# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-sk
pkgver=2.53.5
pkgrel=2
_lang=sk
pkgdesc="Slovak language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('d3a97e96b4cddaa4035e92c7204f853ea1b28733284e39b2b9903a4603660b4bcdc75a105664fe90ccc9bebf579a1191479a61b5e6fbcb89a4714604a7a17a51')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
