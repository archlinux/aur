# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.13.1.1
pkgrel=15
pkgdesc="Metapackage for HeidiSQL - wrapper script (install heidisql-qt6 or heidisql-gtk2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
depends=(heidisql-client)
source=(heidisql)
sha256sums=('46ef8b2c4207d88dd732b70dbc6c012ab0dd7b40d3229227ecfee9153eff3feb')

package() {
  # Modified verison of https://github.com/HeidiSQL/HeidiSQL/blob/lazarus/package-skeleton/usr/bin/heidisql
  # Needed to support our architecture where we support having both gtk2 and qt6 installed
  install -Dm755 "${srcdir}/heidisql" "${pkgdir}/usr/bin/heidisql"
}
