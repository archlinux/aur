# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python2-llvmlite-bin
pkgver=0.22.0
pkgrel=1
epoch=
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
arch=("x86_64")
url="http://llvmlite.pydata.org"
license=('GPL')
depends=("python2" "python2-enum34")
provides=("python2-llvmlite")
conflicts=("python2-llvmlite")
source=("https://anaconda.org/numba/llvmlite/0.22.0/download/linux-64/llvmlite-0.22.0-py27hdbca893_0.tar.bz2")

package() {
	  cd "$srcdir/lib/python2.7/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python2.7/site-packages/"
}
md5sums=('0a9fef160318e5e9e690f8250fb9b941')
