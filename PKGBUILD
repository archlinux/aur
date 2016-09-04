# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python2-llvmlite-bin
pkgver=0.13.0
pkgrel=1
epoch=
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
arch=("x86_64")
url="http://llvmlite.pydata.org"
license=('GPL')
depends=("python2")
provides=("python2-llvmlite")
conflicts=("python2-llvmlite")
source=("https://anaconda.org/numba/llvmlite/$pkgver/download/linux-64/llvmlite-$pkgver-py27_0.tar.bz2")
md5sums=('cdf25f0674da3f95ccda804454f8cd61')

package() {
	  cd "$srcdir/lib/python2.7/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python2.7/site-packages/"
}
