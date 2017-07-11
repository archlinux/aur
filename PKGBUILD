# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=0.17.7
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('MIT')
depends=('python' 'python-dash-renderer' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/5d/10/74b7c71faa68e89a1c693ea102a1638451cb476daca61ac3cfeaad886329/dash-$pkgver.tar.gz")
sha256sums=('1414157e4161d246066d2fa4b322d61871e38cb8d808705ea2694c3ab074ccf2')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
