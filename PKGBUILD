# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-nb-no
pkgver=2.53.23
pkgrel=1
_lang=nb-NO
pkgdesc="Norwegian (Bokmal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('cce0bd74cb488e7c817fee786817d94b616c23be71f07d1cb9e1995a50e840f66469a375e147cb7ae35b66711ba644f75f9638ecc76d5e81f634a310a6f7ca25')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
