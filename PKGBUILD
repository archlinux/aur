pkgname=salome-configuration
pkgver=9.14.0
pkgrel=1
pkgdesc="Salome CMake configuration"
url="https://www.salome-platform.org"
license=('LGPL2+')
depends=()
makedepends=('cmake')
arch=('any')
source=("git+https://github.com/SalomePlatform/configuration.git#tag=V${pkgver//\./_}")
md5sums=('SKIP')

prepare () {
  cd configuration
}

package() {
  install -d "${pkgdir}"/usr/share/salome
  cp -rv "${srcdir}/configuration" "${pkgdir}"/usr/share/salome
}
