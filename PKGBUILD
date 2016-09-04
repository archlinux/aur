# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.13.0
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
source=("https://anaconda.org/numba/llvmlite/$pkgver/download/linux-64/llvmlite-$pkgver-py35_0.tar.bz2")
md5sums=('ca51ff181f85b1a073ca15fd598cc0b8')

package() {
	  cd "$srcdir/lib/python3.5/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.5/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.5/site-packages/"
}
