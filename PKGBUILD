# Maintainer: lesebas <sebastiendotdelignyatgmail.com>

pkgname=python-hurry-filesize
pkgver=0.9
pkgrel=3
pkgdesc="A simple Python library for human readable file sizes (or anything sized in bytes)."
arch=('any')
url="http://pypi.python.org/pypi/hurry.filesize/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/h/hurry.filesize/hurry.filesize-$pkgver.tar.gz")
md5sums=('8549ccd09bb31b5ff1e8e8c1eacc7794')

package() {
  cd "$srcdir/hurry.filesize-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

