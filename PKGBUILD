# Maintainer: Nicola Mori <nicolamori (at) aol (dot) com>
# Contributor: Sven Schneider <archlinux.sandmann (at) googlemail (dot) com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=cmakeed
pkgver=1.17.0
pkgrel=1
pkgdesc="CMake plugin for Eclipse"
arch=('any')
url="https://github.com/15knots/cmakeed"
license=('EPL')
depends=('eclipse-cpp')
source=("https://fifteenknots.jfrog.io/artifactory/p2-zip/CMakeEd-${pkgver}.zip")
noextract=()
md5sums=('05206b37442468f240b1d79dab788f91')

package() {
  
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname}/eclipse"
	
  install -d ${_dest}
	
  cp -a "features" ${_dest}
  cp -a "plugins" ${_dest}
}
