# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=batctl
pkgver=2013.0.0
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
  make DESTDIR="${pkgdir}"  PREFIX=/usr install
}
sha256sums=('c66e0b60e136829ea113c1fddf4029d1e7f5e8f0e75a3cea2a5ccf415cc96feb')
