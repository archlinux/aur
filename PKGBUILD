# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.7.5
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://dask.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/d/dask/dask-$pkgver.tar.gz)
sha256sums=('2b8a67e452d06a3eed5cd8f7e45d05ee90e540f766a971c6809fd2e3c7974117')

#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  nosetests3
#}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
