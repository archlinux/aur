# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4clstdlib-git
pkgver=1
pkgrel=1
pkgdesc="VC4CL implementation of the OpenCL standard-library and is required to build the VC4C compiler"
arch=('any')
url="https://github.com/doe300/VC4CLStdLib"
license=('MIT')
groups=()
depends=()
makedepends=('wget')
optdepends=()
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver')
source=("https://github.com/doe300/VC4CLStdLib/archive/master.tar.gz")
md5sums=('SKIP')
_reponame=VC4CLStdLib

package() {
	cd $srcdir/$_reponame-master
	mkdir -p $pkgdir/usr/include/$pkgname/include
	cp include/* $pkgdir/usr/include/$pkgname/include/
}
