# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_nylonpkgname=nylon-build-stable
_nylonpkgver=1.0
pkgname=nylon-bitbake
pkgver=1.2
pkgrel=1
pkgdesc="BitBake packaging tool from Nylon"
url="http://www.meshcube.org"
depends=(python)
source=(http://meshcube.org/nylon/stable/$_nylonpkgname-$_nylonpkgver.tar.gz)
md5sums=('4f9edec77ee925b1e24a13c55f4dbb99')

build() {
	cd $startdir/src/$_nylonpkgname-$_nylonpkgver/bitbake/
	./setup.py build --prefix /usr/ 
	./setup.py install --root $startdir/pkg/
}
