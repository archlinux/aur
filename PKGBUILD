# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=0.20.0
pkgrel=1
pkgdesc="A python framework for building analytical web applications"
arch=('any')
url="https://github.com/dask/dask"
license=('MIT')
depends=('python' 'python-dash-renderer' 'python-dash-core-components' 'python-dash-html-components' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('71a4fc6bce89bc983fd9dddbd29db9ffb3e2132dd0036cf10a614fe64f20714b')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
