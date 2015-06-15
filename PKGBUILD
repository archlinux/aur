# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.5.0
pkgrel=2
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://dask.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/d/dask/dask-$pkgver.tar.gz)
sha256sums=('733834fc78aee8423c616349f225f197cfcf6451c3bf0a4fdeb412bca57b59b3')

#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  nosetests3
#}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
