# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.24.0
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
source=("https://anaconda.org/numba/llvmlite/0.24.0/download/linux-64/llvmlite-0.24.0-py37hf484d3e_2.tar.bz2")

package() {
	  cd "$srcdir/lib/python3.7/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.7/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.7/site-packages/"
}
md5sums=('485ff7c378841a7da498454fa5088ffa')
