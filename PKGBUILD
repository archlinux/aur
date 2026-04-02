# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-pt-pt
pkgver=2.53.23
pkgrel=1
_lang=pt-PT
pkgdesc="Portuguese (Portugal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('79501f28b7c8271399d9040985a90c911853bec937ad6e5a220116c50a6b3b34a28544a63c0b7315f785eb8f5b574fc3787321907555d6602657e9af66828b92')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
