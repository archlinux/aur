# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.38.0rc1
pkgrel=1
epoch=
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
arch=("x86_64")
url="http://llvmlite.pydata.org"
license=('GPL')
groups=()
depends=("python")
provides=("python-llvmlite=$pkgver")
conflicts=("python-llvmlite")
source=("https://anaconda.org/numba/llvmlite/0.38.0rc1/download/linux-64/llvmlite-0.38.0rc1-py310he1b5a44_0.tar.bz2")

package() {
	  cd "$srcdir/lib/python3.10/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.10/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.10/site-packages/"
}
md5sums=('78276249b418b24aab41e2ca899043d4')
