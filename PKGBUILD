# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=batctl
pkgver=2014.0.0
pkgrel=1
pkgdesc='B.A.T.M.A.N. advanced control and management tool'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
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
sha256sums=('fc4b045eff42452ac96d9901f4514a7f20e4c727d12d50ed8b4255d5b2036ddf')
