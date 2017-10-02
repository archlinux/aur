# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.20.0
pkgrel=1
epoch=
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
arch=("x86_64")
url="http://llvmlite.pydata.org"
license=('GPL')
groups=()
depends=("python")
provides=("python-llvmlite")
conflicts=("python-llvmlite")
source=("https://anaconda.org/numba/llvmlite/$pkgver/download/linux-64/llvmlite-$pkgver-py36_0.tar.bz2")

package() {
	  cd "$srcdir/lib/python3.6/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.6/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.6/site-packages/"
}
md5sums=('80a000535012892cca5fb40697eaf2b4')
