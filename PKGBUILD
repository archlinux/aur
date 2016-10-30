# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.11.1
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz' 'python-cloudpickle' 'python-partd' )
makedepends=('python-setuptools')
source=(https://github.com/dask/dask/archive/$pkgver.zip)
sha256sums=('5ebf2a1029b876a7bb2311750803d87590833837fd6d4b2e0b81c2e0d9784c37')


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
