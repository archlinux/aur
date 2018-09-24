# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=0.27.0
pkgrel=1
pkgdesc="A python framework for building analytical web applications"
arch=('any')
url="https://github.com/dask/dask"
license=('MIT')
depends=('python' 'python-dash-renderer' 'python-dash-core-components' 'python-dash-html-components' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('12505a8bda50b8071e9bc0afbee23e7824c860626a8b91e81e4869779a7bd7fc')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

## vim:ts=2:sw=2:et:
