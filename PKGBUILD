# Maintainer: Yochai Gal <yochai gal at gmail dot com>
# Based on package insync nautilus by Mark Weiman

pkgname=insync-thunar
pkgver=1.3.8.36087
pkgrel=1
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync" "thunar" "thunarx-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/insync-thunar_1.3.8.36087-precise_all.deb")
sha256sums=("345171bf413483f52a3858c0d89101c15fe4083fa86e31ee3f517880a6a626d3")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
