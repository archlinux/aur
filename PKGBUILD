# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batctl
pkgver=2013.3.0
pkgrel=1
pkgdesc="B.A.T.M.A.N. advanced control and management tool"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}
sha256sums=('6de85b2f02ff092dfbbd9d50072a4967e625daca78417a8bc214cf78b2d02074')
