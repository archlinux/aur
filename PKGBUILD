# Maintainer: Yochai Gal <yochai gal at gmail dot com>

pkgname=insync-thunar
pkgver=3.0.23.40579
pkgrel=3
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "thunar" "thunarx-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/insync-thunar_3.0.23.40579_all.deb")
sha256sums=("18f7fd32ae78ee2681d184175d73d8c6a4f67a9500e7832df46bb777d5962b48")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
