# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.10.1
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz' 'python-cloudpickle' 'python-partd' )
makedepends=('python-setuptools')
source=(https://github.com/dask/dask/archive/$pkgver.zip)
sha256sums=('e2523f7d282200b55d3a0e06194500bca6591ae3465ab97ec4c1b9b183ba2dd2')


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
