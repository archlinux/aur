# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batctl
pkgver=2013.2.0
pkgrel=2
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

sha256sums=('603b8bda311a8ac1a3b0446e0837f3d41a7c7d42ea70d68e2a66e884d224deaa')
