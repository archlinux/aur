# Maintainer: Voxan < admin at hessfr dot fr >

pkgname=seamonkey-i18n-es-es
pkgver=2.53.23
pkgrel=1
_lang=es-ES
pkgdesc="Spanish (Spain) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('3e59ddb204bfee9d30956c73a6357bdb220c4a23aeb72083f7e1f2c7d3fa6af339e2b505dd0e94d067d68a0cae8ef25c806f23a6a8aea5ab5d74fc52eb2c4a20')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
