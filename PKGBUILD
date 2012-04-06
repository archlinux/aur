# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=cmakeed
pkgver=1.1.6
pkgrel=1
pkgdesc="CMake plugin for Eclipse"
arch=('any')
url="http://www.cthing.com/CMakeEd.asp"
license=('CPL')
depends=('eclipse')
source=(http://downloads.sourceforge.net/${pkgname}/CMakeEd-${pkgver}.zip)
noextract=()
md5sums=('25599c51944ac11b42a90bf6559474ff')

build() {
	return 0
}

package() {
	cd "${srcdir}/CMakeEd-${pkgver}"
	
	_dest="${pkgdir}/usr/share/eclipse/dropins/${pkgname}/eclipse"
	
	install -d ${_dest}
	
	cp -a "features" ${_dest}
	cp -a "plugins" ${_dest}
}
