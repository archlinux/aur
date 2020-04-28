# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.32.0
pkgrel=2
epoch=
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
arch=("x86_64")
url="http://llvmlite.pydata.org"
license=('GPL')
groups=()
depends=("python")
provides=("python-llvmlite=$pkgver")
conflicts=("python-llvmlite")
source=("https://anaconda.org/numba/llvmlite/0.32.0/download/linux-64/llvmlite-0.32.0-py38hf484d3e_0.tar.bz2")

package() {
	  cd "$srcdir/lib/python3.8/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.8/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.8/site-packages/"
}
md5sums=('edd625125597455992557f094ca82735')
