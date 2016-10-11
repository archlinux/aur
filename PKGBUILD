# Maintainer: Yochai Gal <yochai gal at gmail dot com>

pkgname=insync-thunar
pkgver=1.3.12.36116
pkgrel=1
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync" "thunar" "thunarx-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/insync-thunar_1.3.12.36116-precise_all.deb")
sha256sums=("9453be041f51e8966d290d7788f1b39b")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
