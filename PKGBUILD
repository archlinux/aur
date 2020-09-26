# Contributor: muhas <muhas@mail.ru>
pkgname=dscp
pkgver=0.0.1
pkgrel=2
pkgdesc="frontend for scp and ssh (dsh like)"
url="https://github.com/muhas/dscp"
license=("GPL")
depends=('openssh')
makedepends=('git')
arch=('any')
source=(https://github.com/muhas/dscp/archive/${pkgver}.tar.gz)
md5sums=('3fb46daa8e6c2ce15bb85fc798804cff')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
}


