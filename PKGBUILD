# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=eclipse-emf4cpp
pkgver=0.0.2
pkgrel=1
pkgdesc="A plugin that integrates emf4cpp into Eclipse."
arch=('any')
url="https://code.google.com/p/emf4cpp/"
license=('LGPL')
depends=('eclipse' 'emf4cpp')
optdepends=('eclipse-cdt: if this package is not installed you should install cdt within eclipse')
source=(https://emf4cpp.googlecode.com/files/emf4cpp-plugins-${pkgver}.tar.gz)
md5sums=('c32d12df7229ab0841144b3ce3733e12')
sha256sums=('87540790721874e805cd68d173f794404c006e6b9934cd7dae7579e705a54da1')
sha384sums=('60d232edd06a47ffbb6d564bc486d3138ac75e8a6fe1397ab1d41f22a9d3933f35686ea3e3961edfcc69c43e2d810f82')
sha512sums=('da7eeaba8b73846b8a6e80ee464ad5ba5fa4aa439bceccd0a94434761dcae860304ec5169184a0b97555cb92a8d3c61dd1f5149c1c34c86487c670897ac5ec93')

build() {
  return 0
}

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/eclipse/plugins/"
  install -Dm644 *.jar "${pkgdir}/usr/share/eclipse/plugins/"
}
