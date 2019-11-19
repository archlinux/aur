# Maintainer: Yuri Iozzelli <y.iozzelli@gmail.com>
pkgname=python-llvmlite-bin
pkgver=0.30.0
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
source=("https://anaconda.org/anaconda/llvmlite/0.30.0/download/linux-64/llvmlite-0.30.0-py38hd408876_0.tar.bz2")

package() {
	  cd "$srcdir/lib/python3.8/site-packages"
	  mkdir -p "$pkgdir/usr/lib/python3.8/site-packages/"
	  cp -r * "$pkgdir/usr/lib/python3.8/site-packages/"
}
md5sums=('9aa95f55e8894e4813f187040356bcac')
