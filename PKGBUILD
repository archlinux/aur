# Maintainer: Yochai Gal <yochai gal at gmail dot com>

pkgname=insync-thunar
pkgver=1.3.12.36116
pkgrel=1
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "thunar" "thunarx-python-0.3")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/insync-thunar_1.3.12.36116-precise_all.deb")
sha256sums=("17df2a2a4f1431d97636a968742c48a0e8fcda401a251d29631c7234cc0d7a59")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
