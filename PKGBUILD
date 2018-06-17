# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.23.2
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
source=("https://anaconda.org/numba/llvmlite/0.23.2/download/linux-64/llvmlite-0.23.2-py36hf484d3e_3.tar.bz2")

package() {
	  cd "$srcdir/lib/python3.6/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.6/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.6/site-packages/"
}
md5sums=('7f7e93285c95e02d5da223bd8c846a84')
