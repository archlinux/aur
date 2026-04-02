# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-sv-se
pkgver=2.53.23
pkgrel=1
_lang=sv-SE
pkgdesc="Swedish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('ae7b9294d6860c937502aa86e45ef40e24ae1845264e891ba7cf8b4d2e2deb97d8b07f791edbebbb5e1ad094564f111e41e62de5977ea1b674aa493cc14f933f')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
