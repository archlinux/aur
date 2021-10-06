# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pl
pkgver=2.53.9.1
pkgrel=1
_lang=pl
pkgdesc="Polish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('af3f3404ae4a4c3d2ff10d0e746c24f3ea5f85f75e7d5cd5117c9153983299aed2d0902601633146644bd990aee76a4e1db56f33e59f87f06a079fe8bbc0805c')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
