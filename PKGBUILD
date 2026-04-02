# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-ja
pkgver=2.53.23
pkgrel=1
_lang=ja
pkgdesc="Japanese language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('fe0d72271c80af771d7951502faa4b128da7149030463d3ad7f4e71479b6d5bbcc4e159da1b763c9098a621399c5494bcaa5dc167e47a1d9be99bdfaf462254f')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
