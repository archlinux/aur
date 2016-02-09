# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.7.6
pkgrel=2
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://dask.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz' 'python-cloudpickle')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pygraphviz') # python-cachey
source=(https://pypi.python.org/packages/source/d/dask/dask-$pkgver.tar.gz)
sha256sums=('ff27419e059715907afefe6cbcc1f8c748855c7a93be25be211dabcb689cee3b')

#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  nosetests3
#}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
