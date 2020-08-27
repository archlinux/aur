# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=1.15.0
pkgrel=1
pkgdesc="A python framework for building analytical web applications"
arch=('any')
url="https://plot.ly/products/dash/"
license=('MIT')
depends=('python' 'python-dash-renderer' 'python-dash-core-components' 'python-dash-html-components' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-future' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9fd85d652d67638f7aa480c52a7b761bd3967b4d63d075ac8680d07e775e6b9d')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

## vim:ts=2:sw=2:et:
