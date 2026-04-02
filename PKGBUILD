# Maintainer: Voxan <admin at hessfr dot fr>

pkgname=seamonkey-i18n-pl
pkgver=2.53.12
pkgrel=1
_lang=pl
pkgdesc="Polish language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('bcc18e2677d53f5c318b1ccc4caca83709740081c23241941f4c8534a2f36fd16a547cf77535355132e827895b1c4b4080a5c727d756e3950f2faa2d77c63479')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
