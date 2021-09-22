# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler
pkgver=11.2.1
pkgrel=1
pkgdesc="Map Tiler Desktop - software for converting your data into zoomable maps"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal' 'libwebp')
options=(!strip)
makedepends=('dpkg')
replaces=('maptiler-64bit')
_pkgname="${pkgname}-desktop-${pkgver}-free-linux.deb"
source=("${pkgname}-${pkgver}.deb"::"https://maptiler.download/desktop/${_pkgname}")
md5sums=('884152ba8eb96d6b08381460bcc6764e')

package() {
  dpkg -x "${pkgname}-${pkgver}.deb" "$pkgdir"
}

# vim:set ts=2 sw=2 et:
