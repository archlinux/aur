# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>
pkgname=batctl
pkgver=2012.2.0
pkgrel=1
pkgdesc="B.A.T.M.A.N. advanced control and management tool"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
depends=('glibc')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}  PREFIX=/usr install

}
md5sums=('7abd284098c514d3f2858e8a956c495e')
