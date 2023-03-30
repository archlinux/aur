pkgname=salome-configuration
pkgver=9.10.0
pkgrel=1
pkgdesc="Salome CMake configuration"
url="https://www.salome-platform.org"
license=('LGPL2+')
depends=()
makedepends=('cmake')
arch=('any')
source=("git+https://git.salome-platform.org/gitpub/tools/configuration.git#tag=V9_10_0")
md5sums=(SKIP)

prepare () {
  cd configuration
}

package() {
  install -d "${pkgdir}"/usr/share/salome
  cp -rv "${srcdir}/configuration" "${pkgdir}"/usr/share/salome
}
