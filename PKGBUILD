#Maintainer: Stuart Gray <m00tiny@grayhatfreelancing.com>

pkgname=rabbitvcs-caja
pkgver=0.18
pkgrel=2
pkgdesc="Caja front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="http://rabbitvcs.org/"
depends=('caja' 'python-caja' 'dbus-python>=0.80' "rabbitvcs>=${pkgver}")
license=('GPL')
source=(https://github.com/rabbitvcs/rabbitvcs/archive/v${pkgver}.tar.gz)
md5sums=('25376cff136ad2fac901ff88e07893ef')

package(){
  cd ${srcdir}/rabbitvcs-${pkgver}/
  mkdir -p $pkgdir/usr/share/caja-python/extensions/

  cp clients/caja/RabbitVCS.py $pkgdir/usr/share/caja-python/extensions/
}
