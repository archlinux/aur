# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=gazebo-model-quadrotor
pkgver=1.0
pkgrel=1
pkgdesc="A simple quadrotor model for Gazebo"
arch=('any')
url="http://models.gazebosim.org/quadrotor/"
license=('Apache-2.0')
depends=('gazebo') 
source=('http://models.gazebosim.org/quadrotor/model.tar.gz')
md5sums=('7b8493c54f3700978e75b3b013fe0f25')

package() {
  mkdir -p "${pkgdir}/usr/share/gazebo-7/models/"
  cp -r "$srcdir/quadrotor" "${pkgdir}/usr/share/gazebo-7/models/"
}
