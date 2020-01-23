# Maintainer: Yochai Gal <yochai gal at gmail dot com>

pkgname=insync-thunar
pkgver=3.0.13.40201
pkgrel=3
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "thunar" "thunarx-python-0.3")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/insync-caja_3.0.13.40201_all.deb")
sha256sums=("3d909a7c811cffa07d795bdf9cd45ecce9ba20f5fd70d08cb17b27ffddc417fa")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
