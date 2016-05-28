# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-caja
pkgver=1.3.8.36087
pkgrel=1
pkgdesc="Caja integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync" "python2-caja")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}-precise_all.deb")
sha256sums=("8532963b96df017a4779cfeaafc956b97618506ccff1a77e6751a6c5ed2ad9d1")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}
