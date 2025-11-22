# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.13.1.1
pkgrel=14
pkgdesc="Metapackage for HeidiSQL - wrapper script (install heidisql-qt6 or heidisql-gtk2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0')
depends=(heidisql-client)
source=(heidisql)
sha256sums=('f6c2d1fd39f9841a874ad7fdc6700d39abe964aaf8ee9e5fc4d446cf0e9bba82')

package() {
  # Modified verison of https://github.com/HeidiSQL/HeidiSQL/blob/lazarus/package-skeleton/usr/bin/heidisql
  # Needed to support our architecture where we support having both gtk2 and qt6 installed
  install -Dm755 "${srcdir}/heidisql" "${pkgdir}/usr/bin/heidisql"
}
