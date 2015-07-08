# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: rayte <rabyte__gmail>
# Contributor: aldeano <aldea.diaguita at gmail.com>

pkgname=python-cerealizer
pkgver=0.8.1
pkgrel=1
pkgdesc="A Python module for saving objects in a file [Python 3]"
arch=('any')
url="http://home.gna.org/oomadness/en/cerealizer/"
license=('PSF')
changelog=Changelog
depends=('python')
source=(http://download.gna.org/soya/Cerealizer-$pkgver.tar.bz2)
md5sums=('0dc2e9aadac7dbf2e54d0bbbba2db9bf')

build() {
  cd "$srcdir/Cerealizer-$pkgver"
  
  python setup.py install --root="$pkgdir"
}

# The tests don't work.
#check() {
#  cd "$srcdir/Cerealizer-$pkgver"
#  echo "from . import test1, regtest" > test/__init__.py
#  python -m unittest test
#}
